const fs = require("fs");
const path = require("path");
const nbt = require("prismarine-nbt");

const inputRoot = "data";
const outputFile = path.join("tools", "wiki-renderer", "run", "wiki-render-manifest.json");

function walk(dir) {
  let files = [];
  if (!fs.existsSync(dir)) return files;

  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) files = files.concat(walk(fullPath));
    else if (entry.isFile()) files.push(fullPath);
  }

  return files;
}

function splitResourceLocation(id, defaultNamespace = "minecraft") {
  if (String(id).includes(":")) {
    const [namespace, ...rest] = String(id).split(":");
    return [namespace, rest.join(":")];
  }

  return [defaultNamespace, String(id)];
}

function readJsonIfExists(file) {
  if (!fs.existsSync(file)) return null;

  try {
    return JSON.parse(fs.readFileSync(file, "utf8"));
  } catch {
    return null;
  }
}

async function readNbtFile(file) {
  const buffer = fs.readFileSync(file);
  const parsed = await nbt.parse(buffer);
  return nbt.simplify(parsed.parsed);
}

function getWorldgenStructureInfo(file) {
  const parts = file.split(path.sep);
  const dataIndex = parts.indexOf("data");
  const worldgenIndex = parts.indexOf("worldgen");
  const structureIndex = parts.indexOf("structure");

  if (dataIndex === -1 || worldgenIndex === -1 || structureIndex === -1) return null;
  if (worldgenIndex !== dataIndex + 2 || structureIndex !== worldgenIndex + 1) return null;

  const namespace = parts[dataIndex + 1];
  const relativePath = parts.slice(structureIndex + 1).join("/").replace(/\.json$/, "");

  return {
    namespace,
    id: `${namespace}:${relativePath}`,
    relativePath
  };
}

function getTemplatePoolFile(poolId) {
  const [namespace, poolPath] = splitResourceLocation(poolId);
  return path.join(inputRoot, namespace, "worldgen", "template_pool", `${poolPath}.json`);
}

function getStructureNbtFileFromLocation(location) {
  const [namespace, structurePath] = splitResourceLocation(location);
  return path.join(inputRoot, namespace, "structure", `${structurePath}.nbt`);
}

function addResourceLocation(value, result) {
  if (typeof value !== "string") return;
  if (value === "minecraft:empty") return;
  if (!value.includes(":")) return;
  if (value.startsWith("#")) return;
  result.add(value);
}

function collectTemplatePoolsFromObject(value, result = new Set()) {
  if (value === null || value === undefined) return result;

  if (typeof value === "string") {
    addResourceLocation(value, result);
    return result;
  }

  if (Array.isArray(value)) {
    for (const item of value) collectTemplatePoolsFromObject(item, result);
    return result;
  }

  if (typeof value === "object") {
    for (const [key, nested] of Object.entries(value)) {
      if (
        key === "start_pool" ||
        key === "fallback" ||
        key === "pool" ||
        key === "template_pool" ||
        key === "target_pool"
      ) {
        collectTemplatePoolsFromObject(nested, result);
        continue;
      }

      collectTemplatePoolsFromObject(nested, result);
    }
  }

  return result;
}

function collectElementLocations(element, result = new Set()) {
  if (!element || typeof element !== "object") return result;

  if (typeof element.location === "string") {
    result.add(element.location);
  }

  if (Array.isArray(element.elements)) {
    for (const nested of element.elements) {
      collectElementLocations(nested.element ?? nested, result);
    }
  }

  if (element.element) {
    collectElementLocations(element.element, result);
  }

  return result;
}

function collectJigsawPoolsFromNbt(value, result = new Set()) {
  if (value === null || value === undefined) return result;

  if (Array.isArray(value)) {
    for (const item of value) collectJigsawPoolsFromNbt(item, result);
    return result;
  }

  if (typeof value !== "object") return result;

  const blockId = value.id ?? value.Id ?? value.Name ?? value.name;
  const likelyJigsaw =
    blockId === "minecraft:jigsaw" ||
    value.pool !== undefined ||
    value.target_pool !== undefined ||
    value.final_state !== undefined;

  if (likelyJigsaw) {
    addResourceLocation(value.pool, result);
    addResourceLocation(value.target_pool, result);
  }

  for (const nested of Object.values(value)) {
    collectJigsawPoolsFromNbt(nested, result);
  }

  return result;
}

async function collectJigsawPoolsFromStructureFile(structureFile) {
  if (!fs.existsSync(structureFile)) return new Set();

  try {
    const structure = await readNbtFile(structureFile);
    return collectJigsawPoolsFromNbt(structure);
  } catch {
    return new Set();
  }
}

async function collectStructureFilesFromTemplatePool(poolId, seenPools = new Set(), result = new Map()) {
  if (seenPools.has(poolId)) return result;
  seenPools.add(poolId);

  const poolFile = getTemplatePoolFile(poolId);
  const poolJson = readJsonIfExists(poolFile);
  if (!poolJson) return result;

  for (const element of poolJson.elements ?? []) {
    const elementData = element.element ?? element;
    const locations = collectElementLocations(elementData);

    for (const location of locations) {
      const structureFile = getStructureNbtFileFromLocation(location);
      if (!fs.existsSync(structureFile)) continue;

      if (!result.has(location)) {
        const structure = await readNbtFile(structureFile);
        result.set(location, {
          location,
          file: structureFile,
          size: structure.size ?? [16, 16, 16]
        });

        const jigsawPools = await collectJigsawPoolsFromStructureFile(structureFile);
        for (const nestedPool of jigsawPools) {
          await collectStructureFilesFromTemplatePool(nestedPool, seenPools, result);
        }
      }
    }
  }

  if (poolJson.fallback && poolJson.fallback !== "minecraft:empty") {
    await collectStructureFilesFromTemplatePool(poolJson.fallback, seenPools, result);
  }

  return result;
}

async function main() {
  const worldgenFiles = walk(inputRoot)
    .filter(file => file.endsWith(".json"))
    .filter(file => getWorldgenStructureInfo(file) !== null);

  const groups = [];

  for (const file of worldgenFiles) {
    const info = getWorldgenStructureInfo(file);
    const json = readJsonIfExists(file);
    if (!info || !json) continue;

    const pools = collectTemplatePoolsFromObject(json);
    const pieces = new Map();

    for (const poolId of pools) {
      await collectStructureFilesFromTemplatePool(poolId, new Set(), pieces);
    }

    if (pieces.size === 0) {
      console.warn(`No template pieces found for ${info.id}`);
      continue;
    }

    groups.push({
      id: info.id,
      namespace: info.namespace,
      outputName: info.relativePath,
      pieces: [...pieces.values()]
    });
  }

  fs.mkdirSync(path.dirname(outputFile), { recursive: true });
  fs.writeFileSync(outputFile, JSON.stringify({ groups }, null, 2));

  console.log(`Wrote ${outputFile} with ${groups.length} structure group(s).`);
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});
