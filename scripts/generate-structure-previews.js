// scripts/generate-structure-previews.js
const fs = require("fs");
const path = require("path");
const nbt = require("prismarine-nbt");
const puppeteer = require("puppeteer");
const { Vec3 } = require("vec3");

const standaloneViewer = require("prismarine-viewer").standalone;

const inputRoot = process.env.STRUCTURE_INPUT_ROOT ?? "data";
const outputRoot = process.env.STRUCTURE_PREVIEW_OUTPUT_ROOT ?? path.join("wiki", "images", "structures");

const width = Number(process.env.STRUCTURE_PREVIEW_WIDTH ?? 1200);
const height = Number(process.env.STRUCTURE_PREVIEW_HEIGHT ?? 900);
const viewDistance = Number(process.env.STRUCTURE_PREVIEW_VIEW_DISTANCE ?? 8);
const baseY = Number(process.env.STRUCTURE_PREVIEW_BASE_Y ?? 64);
const portBase = Number(process.env.STRUCTURE_PREVIEW_PORT_BASE ?? 31337);

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

function compareVersionParts(a, b) {
  const aParts = String(a).split(".").map(part => Number(part));
  const bParts = String(b).split(".").map(part => Number(part));
  const length = Math.max(aParts.length, bParts.length);

  for (let i = 0; i < length; i++) {
    const aValue = Number.isFinite(aParts[i]) ? aParts[i] : 0;
    const bValue = Number.isFinite(bParts[i]) ? bParts[i] : 0;
    if (aValue !== bValue) return aValue - bValue;
  }

  return String(a).localeCompare(String(b));
}

function isLikelyMinecraftVersion(version) {
  // Avoid picking mod/plugin versions such as 26.1.2 from release_infos.yml.
  // Minecraft release versions are usually 1.x, optionally with pre/rc suffixes.
  return /^1\.\d+(?:\.\d+)?(?:-(?:pre|rc)\d+)?$/.test(String(version));
}

function getLatestMinecraftVersionFromReleaseInfo() {
  const file = "release_infos.yml";
  if (!fs.existsSync(file)) return null;

  const lines = fs.readFileSync(file, "utf8").split(/\r?\n/);
  const versions = [];
  let inVersions = false;
  let versionsIndent = null;

  for (const line of lines) {
    const match = line.match(/^(\s*)Versions\s*:/);

    if (match) {
      inVersions = true;
      versionsIndent = match[1].length;
      continue;
    }

    if (!inVersions) continue;

    const currentIndent = line.match(/^(\s*)/)?.[1].length ?? 0;

    if (line.trim() && currentIndent <= versionsIndent && !line.trim().startsWith("-")) {
      break;
    }

    const versionMatch = line.match(/^\s*-\s*["']?([^"'\s#]+)["']?/);
    if (versionMatch && isLikelyMinecraftVersion(versionMatch[1])) {
      versions.push(versionMatch[1]);
    }
  }

  if (versions.length === 0) return null;
  return versions.sort(compareVersionParts).at(-1);
}

function getMinecraftVersion() {
  return process.env.MC_VERSION || getLatestMinecraftVersionFromReleaseInfo() || "1.21.4";
}

const version = getMinecraftVersion();
const registry = require("prismarine-registry")(version);
const Block = require("prismarine-block")(registry);
const World = require("prismarine-world")(version);
const Chunk = require("prismarine-chunk")(version);

const plainsBiomeId = registry.biomesByName?.plains?.id ?? 1;

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

async function readNbtFile(file) {
  const buffer = fs.readFileSync(file);
  const parsed = await nbt.parse(buffer);
  return nbt.simplify(parsed.parsed);
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
  } catch (error) {
    console.warn(`Could not inspect jigsaw pools in ${structureFile}: ${error.message}`);
    return new Set();
  }
}

async function collectStructureFilesFromTemplatePool(poolId, seenPools = new Set(), result = new Set()) {
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

      const alreadyHadFile = result.has(structureFile);
      result.add(structureFile);

      if (!alreadyHadFile) {
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

async function collectStructureFilesForWorldgenStructure(worldgenFile) {
  const info = getWorldgenStructureInfo(worldgenFile);
  const json = readJsonIfExists(worldgenFile);
  if (!info || !json) return null;

  const pools = collectTemplatePoolsFromObject(json);
  const files = new Set();

  for (const poolId of pools) {
    await collectStructureFilesFromTemplatePool(poolId, new Set(), files);
  }

  return {
    namespace: info.namespace,
    relativePath: info.relativePath,
    id: info.id,
    files: [...files].sort()
  };
}

async function getWorldgenStructureGroups() {
  const groups = new Map();
  const worldgenFiles = walk(inputRoot)
    .filter(file => file.endsWith(".json"))
    .filter(file => getWorldgenStructureInfo(file) !== null);

  for (const file of worldgenFiles) {
    const group = await collectStructureFilesForWorldgenStructure(file);

    if (!group || group.files.length === 0) {
      console.warn(`No template NBT files found for worldgen structure ${file}`);
      continue;
    }

    groups.set(group.id, group);
  }

  return groups;
}

function getPalette(structure) {
  if (Array.isArray(structure.palette)) return structure.palette;
  if (Array.isArray(structure.palettes?.[0])) return structure.palettes[0];
  return [];
}

function getBlockNameFromPaletteEntry(entry) {
  return entry?.Name ?? entry?.name ?? null;
}

function parseBlockStateString(state) {
  if (!state || typeof state !== "string") return null;

  const match = state.match(/^([^[]+)(?:\[(.*)\])?$/);
  if (!match) return null;

  const name = match[1];
  const properties = {};

  if (match[2]) {
    for (const part of match[2].split(",")) {
      const [key, value] = part.split("=");
      if (key && value !== undefined) properties[key] = value;
    }
  }

  return { name, properties };
}

function getJigsawReplacement(block) {
  const nbtData = block.nbt;
  if (!nbtData || typeof nbtData !== "object") return null;

  const finalState =
    nbtData.final_state ??
    nbtData.finalState ??
    nbtData.FinalState;

  const parsed = parseBlockStateString(finalState);
  if (!parsed || parsed.name === "minecraft:air") return null;

  return parsed;
}

function blockStateToString(blockName, properties = {}) {
  const entries = Object.entries(properties ?? {});
  if (entries.length === 0) return blockName;

  return `${blockName}[${entries.map(([key, value]) => `${key}=${value}`).join(",")}]`;
}

function createBlock(blockName, properties = {}) {
  const blockString = blockStateToString(blockName, properties);

  try {
    return Block.fromString(blockString, plainsBiomeId);
  } catch {}

  const shortName = blockName.replace(/^minecraft:/, "");
  const blockInfo = registry.blocksByName?.[shortName];

  if (!blockInfo) {
    console.warn(`Unknown block ${blockString}; using stone fallback`);
    return Block.fromString("minecraft:stone", plainsBiomeId);
  }

  try {
    return Block.fromProperties(blockInfo.id, properties, plainsBiomeId);
  } catch {
    return Block.fromString(shortName, plainsBiomeId);
  }
}

function collectBlocksFromStructure(structure, offset) {
  const palette = getPalette(structure);
  const blocks = [];

  for (const block of structure.blocks ?? []) {
    const state = palette[block.state];
    let blockName = getBlockNameFromPaletteEntry(state);
    let properties = state?.Properties ?? state?.properties ?? {};

    if (blockName === "minecraft:jigsaw") {
      const replacement = getJigsawReplacement(block);
      if (!replacement) continue;
      blockName = replacement.name;
      properties = replacement.properties;
    }

    if (!blockName || blockName.endsWith(":air") || blockName === "minecraft:structure_void") continue;

    const pos = block.pos ?? block.position;
    if (!Array.isArray(pos) || pos.length < 3) continue;

    blocks.push({
      x: Number(pos[0]) + offset.x,
      y: Number(pos[1]) + offset.y,
      z: Number(pos[2]) + offset.z,
      blockName,
      properties
    });
  }

  return blocks;
}

async function loadBlocksForFiles(files) {
  const allBlocks = [];
  let cursorX = 0;

  for (const file of files) {
    const structure = await readNbtFile(file);
    const size = structure.size ?? [0, 0, 0];

    allBlocks.push(
      ...collectBlocksFromStructure(structure, {
        x: cursorX,
        y: baseY,
        z: 0
      })
    );

    cursorX += Number(size[0] ?? 0) + 2;
  }

  return allBlocks;
}

async function placeBlocks(world, blocks) {
  for (const entry of blocks) {
    const block = createBlock(entry.blockName, entry.properties);
    await world.setBlock(new Vec3(entry.x, entry.y, entry.z), block);
  }
}

function getBounds(blocks) {
  if (blocks.length === 0) {
    return {
      minX: 0,
      maxX: 1,
      minY: baseY,
      maxY: baseY + 1,
      minZ: 0,
      maxZ: 1
    };
  }

  return {
    minX: Math.min(...blocks.map(block => block.x)),
    maxX: Math.max(...blocks.map(block => block.x)),
    minY: Math.min(...blocks.map(block => block.y)),
    maxY: Math.max(...blocks.map(block => block.y)),
    minZ: Math.min(...blocks.map(block => block.z)),
    maxZ: Math.max(...blocks.map(block => block.z))
  };
}

function makeEmptyWorld() {
  return new World((chunkX, chunkZ) => {
    const chunk = new Chunk();

    if (typeof chunk.initialize === "function") {
      chunk.initialize(() => 0, plainsBiomeId);
    }

    return chunk;
  });
}

function getChromiumExecutable() {
  // Prefer an explicitly configured browser, otherwise let Puppeteer use the
  // Chrome it downloaded during npm install. Avoid Ubuntu chromium-browser,
  // because that package installs via Snap and hangs on GitHub Actions.
  const candidates = [
    process.env.CHROME_BIN,
    process.env.CHROMIUM_BIN,
    process.env.PUPPETEER_EXECUTABLE_PATH
  ].filter(Boolean);

  for (const candidate of candidates) {
    if (fs.existsSync(candidate)) return candidate;
  }

  return null;
}

async function wait(ms) {
  await new Promise(resolve => setTimeout(resolve, ms));
}

async function renderWorldImage(blocks, outputPath, port) {
  const world = makeEmptyWorld();
  await placeBlocks(world, blocks);

  const bounds = getBounds(blocks);
  const center = new Vec3(
    Math.floor((bounds.minX + bounds.maxX) / 2),
    Math.floor((bounds.minY + bounds.maxY) / 2),
    Math.floor((bounds.minZ + bounds.maxZ) / 2)
  );

  const viewer = standaloneViewer({
    version,
    world,
    center,
    viewDistance,
    port
  });

  viewer.update();

  const executablePath = getChromiumExecutable();

  const browser = await puppeteer.launch({
    ...(executablePath ? { executablePath } : {}),
    headless: "new",
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--ignore-gpu-blocklist",
      "--enable-webgl",
      "--use-gl=swiftshader",
      "--window-size=1600,1200"
    ]
  });

  try {
    const page = await browser.newPage();
    await page.setViewport({ width, height, deviceScaleFactor: 1 });
    await page.goto(`http://127.0.0.1:${port}`, { waitUntil: "networkidle2", timeout: 60000 });

    // Let chunks, textures, and WebGL finish rendering.
    await wait(Number(process.env.STRUCTURE_PREVIEW_RENDER_WAIT_MS ?? 3500));

    // Best-effort camera positioning. Prismarine-viewer exposes internals differently
    // between releases, so this intentionally checks several likely globals.
    await page.evaluate(() => {
      const candidates = [
        window.viewer,
        window.prismarineViewer,
        window.bot?.viewer
      ].filter(Boolean);

      for (const viewer of candidates) {
        const camera = viewer.camera || viewer.renderer?.camera;
        const controls = viewer.controls || viewer.orbitControls;

        if (camera) {
          camera.position.set(camera.position.x + 20, camera.position.y + 20, camera.position.z + 20);
          camera.updateProjectionMatrix?.();
        }

        controls?.update?.();
      }
    }).catch(() => {});

    fs.mkdirSync(path.dirname(outputPath), { recursive: true });
    await page.screenshot({
      path: outputPath,
      type: "png",
      omitBackground: true
    });

    await page.close();
  } finally {
    await browser.close();

    if (viewer.close) viewer.close();
    else if (viewer.server?.close) viewer.server.close();
  }
}

function removeStaleOutputFiles(validOutputFiles) {
  if (!fs.existsSync(outputRoot)) return;

  for (const file of walk(outputRoot).filter(file => file.endsWith(".png"))) {
    const normalized = path.normalize(file);

    if (!validOutputFiles.has(normalized)) {
      fs.rmSync(file);
      console.log(`Removed stale ${file}`);
    }
  }
}

async function main() {
  console.log(`Rendering structure previews with prismarine-viewer browser renderer for Minecraft ${version}`);

  const groups = await getWorldgenStructureGroups();
  const validOutputFiles = new Set();

  console.log(`Found ${groups.size} worldgen structure group(s).`);

  let index = 0;

  for (const group of groups.values()) {
    const blocks = await loadBlocksForFiles(group.files);
    const outputPath = path.join(outputRoot, group.namespace, `${group.relativePath}.png`);

    validOutputFiles.add(path.normalize(outputPath));

    const port = portBase + index;
    await renderWorldImage(blocks, outputPath, port);

    const size = fs.statSync(outputPath).size;
    console.log(`Generated ${outputPath} from ${group.files.length} structure template(s), ${blocks.length} block(s), ${size} bytes`);

    index++;
  }

  removeStaleOutputFiles(validOutputFiles);
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});
