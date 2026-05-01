// scripts/generate-structure-viewers.js
// Generates interactive, browser-viewable 3D structure previews for Wiki.js embeds.
// Output: wiki/viewers/structures/<namespace>/<structure path>/index.html

const fs = require("fs");
const path = require("path");
const nbt = require("prismarine-nbt");

const inputRoot = process.env.STRUCTURE_INPUT_ROOT ?? "data";
const outputRoot = process.env.STRUCTURE_VIEWER_OUTPUT_ROOT ?? path.join("wiki", "viewers", "structures");
const generateWorldgenStructurePreviews = String(process.env.STRUCTURE_VIEWER_WORLDGEN ?? "true") !== "false";
const maxBlocks = Number(process.env.STRUCTURE_VIEWER_MAX_BLOCKS ?? 50000);

const IGNORED_BLOCKS = new Set([
  "minecraft:air",
  "minecraft:cave_air",
  "minecraft:void_air",
  "minecraft:structure_void",
  "minecraft:barrier",
  "minecraft:light"
]);

const stats = {
  structuresRead: 0,
  poolsRead: 0,
  jigsawPoolsFollowed: 0,
  viewers: 0
};

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

function getStructureInfo(file) {
  const parts = file.split(path.sep);
  const dataIndex = parts.indexOf("data");
  const structureIndex = parts.indexOf("structure");
  if (dataIndex === -1 || structureIndex === -1) return null;
  if (structureIndex !== dataIndex + 2) return null;

  const namespace = parts[dataIndex + 1];
  const relativeParts = parts.slice(structureIndex + 1);
  if (relativeParts.length === 0) return null;

  const topFolder = relativeParts.length > 1
    ? relativeParts[0]
    : path.basename(relativeParts[0], ".nbt");
  const structureFile = relativeParts.join("/").replace(/\.nbt$/, "");

  return { namespace, topFolder, structureFile };
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
  return { namespace, id: `${namespace}:${relativePath}`, relativePath };
}

function readJsonIfExists(file) {
  if (!fs.existsSync(file)) return null;
  try { return JSON.parse(fs.readFileSync(file, "utf8")); }
  catch { return null; }
}

async function readNbtFile(file) {
  const parsed = await nbt.parse(fs.readFileSync(file));
  stats.structuresRead++;
  return nbt.simplify(parsed.parsed);
}

function getPalette(structure) {
  if (Array.isArray(structure.palette)) return structure.palette;
  if (Array.isArray(structure.palettes?.[0])) return structure.palettes[0];
  return [];
}

function getBlockNameFromPaletteEntry(entry) {
  return entry?.Name ?? entry?.name ?? null;
}

function parseBlockStateString(value) {
  if (typeof value !== "string") return null;
  const match = value.match(/^([^\[]+)(?:\[(.*)\])?$/);
  if (!match) return null;
  const name = match[1];
  const properties = {};
  if (match[2]) {
    for (const part of match[2].split(",")) {
      const [key, val] = part.split("=");
      if (key && val !== undefined) properties[key] = val;
    }
  }
  return { name, properties };
}

function getJigsawReplacement(block) {
  const nbtData = block.nbt;
  if (!nbtData || typeof nbtData !== "object") return null;
  const finalState = nbtData.final_state ?? nbtData.finalState ?? nbtData.FinalState;
  const parsed = parseBlockStateString(finalState);
  if (!parsed || parsed.name === "minecraft:air") return null;
  return parsed;
}

function collectBlocksFromStructure(structure) {
  const palette = getPalette(structure);
  const blocks = [];

  for (const block of structure.blocks ?? []) {
    const state = palette[block.state];
    let name = getBlockNameFromPaletteEntry(state);
    let properties = state?.Properties ?? state?.properties ?? {};

    if (name === "minecraft:jigsaw") {
      const replacement = getJigsawReplacement(block);
      if (!replacement) continue;
      name = replacement.name;
      properties = replacement.properties;
    }

    if (!name || IGNORED_BLOCKS.has(name)) continue;
    const pos = block.pos ?? block.position;
    if (!Array.isArray(pos) || pos.length < 3) continue;

    blocks.push({ x: Number(pos[0]), y: Number(pos[1]), z: Number(pos[2]), name, properties });
  }

  return blocks;
}

function normalizeBlocks(blocks) {
  if (blocks.length === 0) return blocks;
  let minX = Infinity, minY = Infinity, minZ = Infinity;
  for (const block of blocks) {
    if (block.x < minX) minX = block.x;
    if (block.y < minY) minY = block.y;
    if (block.z < minZ) minZ = block.z;
  }
  return blocks.map(block => ({ ...block, x: block.x - minX, y: block.y - minY, z: block.z - minZ }));
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
  if (typeof value === "string") { addResourceLocation(value, result); return result; }
  if (Array.isArray(value)) { for (const item of value) collectTemplatePoolsFromObject(item, result); return result; }
  if (typeof value === "object") for (const nested of Object.values(value)) collectTemplatePoolsFromObject(nested, result);
  return result;
}

function getTemplatePoolFile(poolId) {
  const [namespace, poolPath] = splitResourceLocation(poolId);
  return path.join(inputRoot, namespace, "worldgen", "template_pool", `${poolPath}.json`);
}

function getStructureNbtFileFromLocation(location) {
  const [namespace, structurePath] = splitResourceLocation(location);
  return path.join(inputRoot, namespace, "structure", `${structurePath}.nbt`);
}

function collectElementLocations(element, result = new Set()) {
  if (!element || typeof element !== "object") return result;
  if (typeof element.location === "string" && element.location !== "minecraft:empty") result.add(element.location);
  if (Array.isArray(element.elements)) for (const nested of element.elements) collectElementLocations(nested.element ?? nested, result);
  if (element.element) collectElementLocations(element.element, result);
  return result;
}

function collectJigsawPoolsFromNbt(value, result = new Set()) {
  if (value === null || value === undefined) return result;
  if (Array.isArray(value)) { for (const item of value) collectJigsawPoolsFromNbt(item, result); return result; }
  if (typeof value !== "object") return result;

  const blockId = value.id ?? value.Id ?? value.Name ?? value.name;
  const likelyJigsaw = blockId === "minecraft:jigsaw" || value.pool !== undefined || value.target_pool !== undefined || value.final_state !== undefined;
  if (likelyJigsaw) {
    addResourceLocation(value.pool, result);
    addResourceLocation(value.target_pool, result);
  }
  for (const nested of Object.values(value)) collectJigsawPoolsFromNbt(nested, result);
  return result;
}

async function collectJigsawPoolsFromStructureFile(structureFile) {
  if (!fs.existsSync(structureFile)) return new Set();
  try { return collectJigsawPoolsFromNbt(await readNbtFile(structureFile)); }
  catch (error) { console.warn(`Could not inspect jigsaw pools in ${structureFile}: ${error.message}`); return new Set(); }
}

async function collectStructureFilesFromTemplatePool(poolId, seenPools = new Set(), result = new Set()) {
  if (seenPools.has(poolId)) return result;
  seenPools.add(poolId);
  const poolJson = readJsonIfExists(getTemplatePoolFile(poolId));
  if (!poolJson) return result;
  stats.poolsRead++;

  for (const element of poolJson.elements ?? []) {
    const locations = collectElementLocations(element.element ?? element);
    for (const location of locations) {
      const structureFile = getStructureNbtFileFromLocation(location);
      if (!fs.existsSync(structureFile)) continue;
      const alreadyHadFile = result.has(structureFile);
      result.add(structureFile);
      if (!alreadyHadFile) {
        for (const nestedPool of await collectJigsawPoolsFromStructureFile(structureFile)) {
          stats.jigsawPoolsFollowed++;
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
  const files = new Set();
  for (const poolId of collectTemplatePoolsFromObject(json)) {
    await collectStructureFilesFromTemplatePool(poolId, new Set(), files);
  }
  return { namespace: info.namespace, relativePath: info.relativePath, id: info.id, files: [...files].sort() };
}

function getDirectStructureGroups() {
  const groups = new Map();
  for (const file of walk(inputRoot).filter(file => file.endsWith(".nbt"))) {
    const info = getStructureInfo(file);
    if (!info) continue;
    const key = `${info.namespace}:${info.topFolder}`;
    if (!groups.has(key)) groups.set(key, { namespace: info.namespace, outputName: info.topFolder, files: [] });
    groups.get(key).files.push(file);
  }
  return groups;
}

async function getWorldgenStructureGroups() {
  const groups = new Map();
  if (!generateWorldgenStructurePreviews) return groups;
  for (const file of walk(inputRoot).filter(file => file.endsWith(".json")).filter(file => getWorldgenStructureInfo(file) !== null)) {
    const group = await collectStructureFilesForWorldgenStructure(file);
    if (!group || group.files.length === 0) {
      console.warn(`No template NBT files found for worldgen structure ${file}`);
      continue;
    }
    groups.set(group.id, { namespace: group.namespace, outputName: group.relativePath, files: group.files });
  }
  return groups;
}

async function expandStructureFilesThroughJigsawPools(files) {
  const result = new Set(files), queue = [...files], queued = new Set(queue), processed = new Set(), seenPools = new Set();
  while (queue.length > 0) {
    const structureFile = queue.shift();
    if (processed.has(structureFile)) continue;
    processed.add(structureFile);
    const before = result.size;
    for (const poolId of await collectJigsawPoolsFromStructureFile(structureFile)) {
      stats.jigsawPoolsFollowed++;
      await collectStructureFilesFromTemplatePool(poolId, seenPools, result);
    }
    if (result.size !== before) {
      for (const file of result) if (!queued.has(file) && !processed.has(file)) { queue.push(file); queued.add(file); }
    }
  }
  return [...result].sort();
}

function blockColor(name) {
  const id = String(name).replace(/^minecraft:/, "");
  if (id.includes("leaves")) return "#3f8f3f";
  if (id.includes("grass") || id.includes("moss") || id.includes("vine")) return "#5fa043";
  if (id.includes("water")) return "#3f76e4";
  if (id.includes("lava") || id.includes("fire")) return "#ff6a00";
  if (id.includes("sand")) return "#d8c98a";
  if (id.includes("stone") || id.includes("deepslate") || id.includes("tuff")) return "#777777";
  if (id.includes("dirt") || id.includes("mud")) return "#7a5436";
  if (id.includes("wood") || id.includes("log") || id.includes("planks")) return "#9a6a3a";
  if (id.includes("glass")) return "#9fd8ff";
  if (id.includes("brick") || id.includes("terracotta")) return "#9f4f3f";
  if (id.includes("copper")) return "#b87333";
  if (id.includes("gold")) return "#f5d442";
  if (id.includes("iron")) return "#d8d8d8";
  let hash = 0;
  for (const char of id) hash = ((hash << 5) - hash + char.charCodeAt(0)) | 0;
  const hue = Math.abs(hash) % 360;
  return `hsl(${hue}, 38%, 56%)`;
}

function makeViewerHtml(title, blocks, sourceFiles, truncated) {
  const normalized = normalizeBlocks(blocks);
  const renderBlocks = normalized.slice(0, maxBlocks).map(block => ({ x: block.x, y: block.y, z: block.z, n: block.name, c: blockColor(block.name) }));
  const total = normalized.length;
  const payload = JSON.stringify({ title, total, truncated, blocks: renderBlocks, sourceFiles: sourceFiles.map(file => file.replace(/\\/g, "/")) });

  return `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>${escapeHtml(title)} · 3D Structure Preview</title>
  <style>
    html, body { margin: 0; height: 100%; overflow: hidden; background: #0f172a; color: #e5e7eb; font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; }
    #viewer { position: fixed; inset: 0; }
    .hud { position: fixed; left: 16px; top: 16px; max-width: min(460px, calc(100vw - 32px)); padding: 12px 14px; border: 1px solid rgba(255,255,255,.14); border-radius: 14px; background: rgba(15,23,42,.76); backdrop-filter: blur(10px); box-shadow: 0 12px 30px rgba(0,0,0,.28); }
    .hud h1 { margin: 0 0 6px; font-size: 16px; line-height: 1.25; }
    .hud p { margin: 0; color: #cbd5e1; font-size: 13px; line-height: 1.4; }
    .controls { position: fixed; right: 16px; bottom: 16px; display: flex; gap: 8px; flex-wrap: wrap; justify-content: end; }
    button { border: 1px solid rgba(255,255,255,.18); border-radius: 999px; padding: 9px 12px; background: rgba(15,23,42,.82); color: #f8fafc; cursor: pointer; }
    button:hover { background: rgba(30,41,59,.95); }
    .warning { color: #fde68a; margin-top: 6px !important; }
  </style>
</head>
<body>
  <div id="viewer"></div>
  <div class="hud">
    <h1>${escapeHtml(title)}</h1>
    <p>Drag to rotate · Scroll/pinch to zoom · Right-drag to pan</p>
    <p>${renderBlocks.length.toLocaleString()} of ${total.toLocaleString()} blocks shown</p>
    ${truncated ? `<p class="warning">Large preview capped by STRUCTURE_VIEWER_MAX_BLOCKS.</p>` : ""}
  </div>
  <div class="controls">
    <button id="reset">Reset camera</button>
    <button id="toggleGrid">Toggle grid</button>
  </div>

  <script type="importmap">
    { "imports": { "three": "https://unpkg.com/three@0.164.1/build/three.module.js", "three/addons/": "https://unpkg.com/three@0.164.1/examples/jsm/" } }
  </script>
  <script type="module">
    import * as THREE from "three";
    import { OrbitControls } from "three/addons/controls/OrbitControls.js";

    const data = ${payload};
    const container = document.getElementById("viewer");
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0x0f172a);

    const camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 10000);
    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    renderer.setSize(window.innerWidth, window.innerHeight);
    container.appendChild(renderer.domElement);

    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = 0.08;

    scene.add(new THREE.HemisphereLight(0xffffff, 0x334155, 2.2));
    const sun = new THREE.DirectionalLight(0xffffff, 1.8);
    sun.position.set(50, 90, 40);
    scene.add(sun);

    const byColor = new Map();
    for (const block of data.blocks) {
      if (!byColor.has(block.c)) byColor.set(block.c, []);
      byColor.get(block.c).push(block);
    }

    const geometry = new THREE.BoxGeometry(1, 1, 1);
    const matrix = new THREE.Matrix4();
    let maxX = 0, maxY = 0, maxZ = 0;

    for (const [color, blocks] of byColor) {
      const material = new THREE.MeshStandardMaterial({ color, roughness: 0.82, metalness: 0.02 });
      const mesh = new THREE.InstancedMesh(geometry, material, blocks.length);
      mesh.castShadow = false;
      mesh.receiveShadow = false;
      blocks.forEach((block, i) => {
        maxX = Math.max(maxX, block.x); maxY = Math.max(maxY, block.y); maxZ = Math.max(maxZ, block.z);
        matrix.makeTranslation(block.x + 0.5, block.y + 0.5, block.z + 0.5);
        mesh.setMatrixAt(i, matrix);
      });
      scene.add(mesh);
    }

    const center = new THREE.Vector3((maxX + 1) / 2, (maxY + 1) / 2, (maxZ + 1) / 2);
    const size = Math.max(maxX + 1, maxY + 1, maxZ + 1, 8);
    const grid = new THREE.GridHelper(Math.max(maxX + 1, maxZ + 1, 8), Math.max(maxX + 1, maxZ + 1, 8));
    grid.position.set(center.x, 0, center.z);
    scene.add(grid);

    function resetCamera() {
      controls.target.copy(center);
      camera.position.set(center.x + size * 1.25, center.y + size * 0.9, center.z + size * 1.25);
      camera.near = Math.max(0.1, size / 1000);
      camera.far = Math.max(1000, size * 10);
      camera.updateProjectionMatrix();
      controls.update();
    }

    document.getElementById("reset").addEventListener("click", resetCamera);
    document.getElementById("toggleGrid").addEventListener("click", () => { grid.visible = !grid.visible; });
    resetCamera();

    window.addEventListener("resize", () => {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    });

    renderer.setAnimationLoop(() => {
      controls.update();
      renderer.render(scene, camera);
    });
  </script>
</body>
</html>`;
}

function escapeHtml(value) {
  return String(value).replace(/[&<>"']/g, char => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[char]));
}

function getViewerOutputDirectory(group) {
  return path.join(outputRoot, group.namespace, group.outputName);
}

async function loadBlocksForFiles(files) {
  const blocks = [];
  for (const file of files) blocks.push(...collectBlocksFromStructure(await readNbtFile(file)));
  return blocks;
}

function removeStaleOutputFiles(validOutputFiles) {
  if (!fs.existsSync(outputRoot)) return;
  for (const file of walk(outputRoot).filter(file => file.endsWith(".html"))) {
    if (!validOutputFiles.has(path.normalize(file))) {
      fs.rmSync(file);
      console.log(`Removed stale ${file}`);
    }
  }
}

async function main() {
  const groups = await getWorldgenStructureGroups();
  if (groups.size === 0) for (const [key, value] of getDirectStructureGroups()) groups.set(key, value);

  console.log(`Found ${groups.size} interactive structure group(s).`);
  const validOutputFiles = new Set();
  const indexItems = [];

  for (const group of groups.values()) {
    group.files = await expandStructureFilesThroughJigsawPools(group.files.sort());
    const blocks = await loadBlocksForFiles(group.files);
    const outputDirectory = getViewerOutputDirectory(group);
    const outputPath = path.join(outputDirectory, "index.html");
    const title = `${group.namespace}:${group.outputName}`;
    const truncated = blocks.length > maxBlocks;

    fs.mkdirSync(outputDirectory, { recursive: true });
    fs.writeFileSync(outputPath, makeViewerHtml(title, blocks, group.files, truncated));
    validOutputFiles.add(path.normalize(outputPath));
    indexItems.push({ title, href: path.relative(outputRoot, outputPath).replace(/\\/g, "/") });
    stats.viewers++;
    console.log(`Generated ${outputPath} from ${group.files.length} structure part(s), ${blocks.length} block(s).`);
  }

  const indexPath = path.join(outputRoot, "index.html");
  fs.mkdirSync(outputRoot, { recursive: true });
  fs.writeFileSync(indexPath, `<!doctype html><meta charset="utf-8"><title>Structure Viewers</title><style>body{font-family:system-ui;margin:32px;line-height:1.5}a{display:block;margin:6px 0}</style><h1>Structure Viewers</h1>${indexItems.map(item => `<a href="${escapeHtml(item.href)}">${escapeHtml(item.title)}</a>`).join("\n")}`);
  validOutputFiles.add(path.normalize(indexPath));

  removeStaleOutputFiles(validOutputFiles);
  console.log(`Generated ${stats.viewers} interactive structure viewer(s). Read ${stats.structuresRead} NBT file(s), ${stats.poolsRead} template pool(s), followed ${stats.jigsawPoolsFollowed} jigsaw pool reference(s).`);
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});
