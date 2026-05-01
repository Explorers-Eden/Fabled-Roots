// scripts/generate-structure-previews.js
const fs = require("fs");
const path = require("path");
const nbt = require("prismarine-nbt");
const { PNG } = require("pngjs");

const inputRoot = process.env.STRUCTURE_INPUT_ROOT ?? "data";
const outputRoot = process.env.STRUCTURE_PREVIEW_OUTPUT_ROOT ?? path.join("wiki", "images", "structures");
const generateWorldgenStructurePreviews = String(process.env.STRUCTURE_PREVIEW_WORLDGEN ?? "true") !== "false";

const tileWidth = Number(process.env.STRUCTURE_PREVIEW_TILE_WIDTH ?? 24);
const tileHeight = Number(process.env.STRUCTURE_PREVIEW_TILE_HEIGHT ?? 14);
const blockHeight = Number(process.env.STRUCTURE_PREVIEW_BLOCK_HEIGHT ?? 16);
const padding = Number(process.env.STRUCTURE_PREVIEW_PADDING ?? 44);
const maxImageSize = Number(process.env.STRUCTURE_PREVIEW_MAX_SIZE ?? 2600);
const transparentBackground = String(process.env.STRUCTURE_PREVIEW_TRANSPARENT ?? "true") !== "false";

const IGNORED_BLOCKS = new Set([
  "minecraft:air",
  "minecraft:cave_air",
  "minecraft:void_air",
  "minecraft:structure_void",
  "minecraft:barrier",
  "minecraft:light"
]);

const stats = {
  mainImages: 0,
  structuresRead: 0,
  poolsRead: 0,
  jigsawPoolsFollowed: 0
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

function titlePath(id) {
  return String(id).replace(/^#/, "").replace(/^[^:]+:/, "");
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

  const topFolder =
    relativeParts.length > 1
      ? relativeParts[0]
      : path.basename(relativeParts[0], ".nbt");

  return { namespace, topFolder };
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

function getPalette(structure) {
  if (Array.isArray(structure.palette)) return structure.palette;
  if (Array.isArray(structure.palettes?.[0])) return structure.palettes[0];
  return [];
}

function getBlockNameFromPaletteEntry(entry) {
  return entry?.Name ?? entry?.name ?? null;
}

async function readNbtFile(file) {
  const buffer = fs.readFileSync(file);
  const parsed = await nbt.parse(buffer);
  stats.structuresRead++;
  return nbt.simplify(parsed.parsed);
}

function readJsonIfExists(file) {
  if (!fs.existsSync(file)) return null;

  try {
    return JSON.parse(fs.readFileSync(file, "utf8"));
  } catch {
    return null;
  }
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

  if (typeof element.location === "string") {
    result.add(element.location);
  }

  // list_pool_element and nested wrappers
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
  } catch (error) {
    console.warn(`Could not inspect jigsaw pools in ${structureFile}: ${error.message}`);
    return new Set();
  }
}

async function collectStructureFilesFromTemplatePool(
  poolId,
  seenPools = new Set(),
  result = new Set()
) {
  if (seenPools.has(poolId)) return result;
  seenPools.add(poolId);

  const poolFile = getTemplatePoolFile(poolId);
  const poolJson = readJsonIfExists(poolFile);
  if (!poolJson) return result;

  stats.poolsRead++;

  for (const element of poolJson.elements ?? []) {
    const elementData = element.element ?? element;
    const locations = collectElementLocations(elementData);

    for (const location of locations) {
      const structureFile = getStructureNbtFileFromLocation(location);

      if (!fs.existsSync(structureFile)) continue;

      if (!result.has(structureFile)) {
        result.add(structureFile);

        // Important: actual generated structures can continue through jigsaw blocks
        // into more template pools. Follow those pools so previews do not end up
        // showing only the start pool.
        const jigsawPools = await collectJigsawPoolsFromStructureFile(structureFile);

        for (const nestedPool of jigsawPools) {
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

function getDirectStructureGroups() {
  const structureFiles = walk(inputRoot)
    .filter(file => file.endsWith(".nbt"))
    .map(file => ({ file, info: getStructureInfo(file) }))
    .filter(entry => entry.info !== null);

  const groups = new Map();

  for (const { file, info } of structureFiles) {
    const key = `${info.namespace}:${info.topFolder}`;

    if (!groups.has(key)) {
      groups.set(key, {
        namespace: info.namespace,
        outputName: info.topFolder,
        files: []
      });
    }

    groups.get(key).files.push(file);
  }

  return groups;
}

async function getWorldgenStructureGroups() {
  const groups = new Map();

  if (!generateWorldgenStructurePreviews) return groups;

  const worldgenFiles = walk(inputRoot)
    .filter(file => file.endsWith(".json"))
    .filter(file => getWorldgenStructureInfo(file) !== null);

  for (const file of worldgenFiles) {
    const group = await collectStructureFilesForWorldgenStructure(file);

    if (!group || group.files.length === 0) {
      console.warn(`No template NBT files found for worldgen structure ${file}`);
      continue;
    }

    groups.set(group.id, {
      namespace: group.namespace,
      outputName: group.relativePath,
      files: group.files
    });
  }

  return groups;
}

const COLOR_SCHEMES = [
  { patterns: ["amethyst", "purple"], color: { r: 143, g: 104, b: 200, a: 255 } },
  { patterns: ["budding_amethyst"], color: { r: 128, g: 96, b: 181, a: 255 } },
  { patterns: ["chest", "barrel"], color: { r: 176, g: 111, b: 40, a: 255 } },
  { patterns: ["bookshelf", "lectern"], color: { r: 154, g: 106, b: 50, a: 255 } },
  { patterns: ["cobweb"], color: { r: 221, g: 221, b: 229, a: 155 } },
  { patterns: ["chain", "iron", "anvil"], color: { r: 85, g: 89, b: 95, a: 255 } },
  { patterns: ["lantern", "torch", "candle", "glowstone", "shroomlight", "sea_lantern"], color: { r: 214, g: 169, b: 74, a: 255 } },
  { patterns: ["deepslate", "blackstone", "basalt"], color: { r: 63, g: 65, b: 72, a: 255 } },
  { patterns: ["tuff"], color: { r: 119, g: 116, b: 109, a: 255 } },
  { patterns: ["andesite", "diorite", "granite"], color: { r: 137, g: 137, b: 137, a: 255 } },
  { patterns: ["mossy_stone"], color: { r: 105, g: 125, b: 87, a: 255 } },
  { patterns: ["stone", "cobblestone", "brick"], color: { r: 119, g: 119, b: 119, a: 255 } },
  { patterns: ["grass_block", "grass"], color: { r: 145, g: 189, b: 89, a: 210 } },
  { patterns: ["moss", "azalea", "leaf", "leaves", "vine"], color: { r: 119, g: 171, b: 47, a: 210 } },
  { patterns: ["dirt", "mud", "podzol", "rooted_dirt"], color: { r: 121, g: 83, b: 58, a: 255 } },
  { patterns: ["sand", "sandstone"], color: { r: 214, g: 194, b: 122, a: 255 } },
  { patterns: ["gravel"], color: { r: 119, g: 119, b: 119, a: 255 } },
  { patterns: ["clay"], color: { r: 154, g: 164, b: 173, a: 255 } },
  { patterns: ["snow", "ice"], color: { r: 215, g: 238, b: 244, a: 205 } },
  { patterns: ["spruce"], color: { r: 122, g: 83, b: 48, a: 255 } },
  { patterns: ["oak"], color: { r: 185, g: 139, b: 75, a: 255 } },
  { patterns: ["birch"], color: { r: 214, g: 194, b: 122, a: 255 } },
  { patterns: ["jungle"], color: { r: 176, g: 122, b: 69, a: 255 } },
  { patterns: ["acacia"], color: { r: 176, g: 91, b: 50, a: 255 } },
  { patterns: ["dark_oak"], color: { r: 90, g: 56, b: 34, a: 255 } },
  { patterns: ["mangrove"], color: { r: 141, g: 63, b: 50, a: 255 } },
  { patterns: ["cherry"], color: { r: 216, g: 154, b: 168, a: 255 } },
  { patterns: ["bamboo"], color: { r: 196, g: 184, b: 95, a: 255 } },
  { patterns: ["crimson"], color: { r: 126, g: 46, b: 73, a: 255 } },
  { patterns: ["warped"], color: { r: 47, g: 140, b: 134, a: 255 } },
  { patterns: ["planks", "log", "wood", "stem", "hyphae", "slab", "stairs", "fence", "door", "trapdoor", "sign"], color: { r: 138, g: 90, b: 47, a: 255 } },
  { patterns: ["water"], color: { r: 61, g: 117, b: 196, a: 145 } },
  { patterns: ["lava"], color: { r: 230, g: 90, b: 30, a: 255 } },
  { patterns: ["glass"], color: { r: 158, g: 208, b: 221, a: 120 } },
  { patterns: ["copper"], color: { r: 184, g: 121, b: 83, a: 255 } },
  { patterns: ["gold"], color: { r: 225, g: 184, b: 76, a: 255 } },
  { patterns: ["diamond"], color: { r: 95, g: 208, b: 214, a: 255 } },
  { patterns: ["emerald"], color: { r: 52, g: 182, b: 90, a: 255 } },
  { patterns: ["lapis"], color: { r: 52, g: 89, b: 201, a: 255 } },
  { patterns: ["redstone"], color: { r: 177, g: 31, b: 31, a: 255 } },
  { patterns: ["coal"], color: { r: 47, g: 47, b: 47, a: 255 } },
  { patterns: ["quartz"], color: { r: 216, g: 208, b: 192, a: 255 } }
];

function hashColor(text) {
  let hash = 0;
  for (let i = 0; i < text.length; i++) {
    hash = ((hash << 5) - hash + text.charCodeAt(i)) | 0;
  }

  const hue = Math.abs(hash) % 360;
  const saturation = 28 + (Math.abs(hash >> 8) % 28);
  const lightness = 45 + (Math.abs(hash >> 16) % 18);

  return hslToRgb(hue, saturation, lightness);
}

function hslToRgb(h, s, l) {
  s /= 100;
  l /= 100;

  const c = (1 - Math.abs(2 * l - 1)) * s;
  const x = c * (1 - Math.abs((h / 60) % 2 - 1));
  const m = l - c / 2;

  let r = 0;
  let g = 0;
  let b = 0;

  if (h < 60) [r, g, b] = [c, x, 0];
  else if (h < 120) [r, g, b] = [x, c, 0];
  else if (h < 180) [r, g, b] = [0, c, x];
  else if (h < 240) [r, g, b] = [0, x, c];
  else if (h < 300) [r, g, b] = [x, 0, c];
  else [r, g, b] = [c, 0, x];

  return {
    r: Math.round((r + m) * 255),
    g: Math.round((g + m) * 255),
    b: Math.round((b + m) * 255),
    a: 255
  };
}

function getBlockColor(blockName) {
  const short = blockName.replace(/^minecraft:/, "");

  for (const scheme of COLOR_SCHEMES) {
    if (scheme.patterns.some(pattern => short.includes(pattern))) {
      return scheme.color;
    }
  }

  return hashColor(blockName);
}

function shadeColor(color, factor) {
  return {
    r: Math.max(0, Math.min(255, Math.round(color.r * factor))),
    g: Math.max(0, Math.min(255, Math.round(color.g * factor))),
    b: Math.max(0, Math.min(255, Math.round(color.b * factor))),
    a: color.a ?? 255
  };
}

function blendPixel(png, x, y, color) {
  x = Math.round(x);
  y = Math.round(y);

  if (x < 0 || y < 0 || x >= png.width || y >= png.height) return;

  const idx = (png.width * y + x) << 2;
  const alpha = (color.a ?? 255) / 255;

  if (alpha >= 1 || png.data[idx + 3] === 0) {
    png.data[idx] = color.r;
    png.data[idx + 1] = color.g;
    png.data[idx + 2] = color.b;
    png.data[idx + 3] = Math.round(alpha * 255);
    return;
  }

  const existingAlpha = png.data[idx + 3] / 255;
  const outAlpha = alpha + existingAlpha * (1 - alpha);

  png.data[idx] = Math.round((color.r * alpha + png.data[idx] * existingAlpha * (1 - alpha)) / outAlpha);
  png.data[idx + 1] = Math.round((color.g * alpha + png.data[idx + 1] * existingAlpha * (1 - alpha)) / outAlpha);
  png.data[idx + 2] = Math.round((color.b * alpha + png.data[idx + 2] * existingAlpha * (1 - alpha)) / outAlpha);
  png.data[idx + 3] = Math.round(outAlpha * 255);
}

function pointInPolygon(x, y, polygon) {
  let inside = false;

  for (let i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
    const xi = polygon[i].x;
    const yi = polygon[i].y;
    const xj = polygon[j].x;
    const yj = polygon[j].y;

    const intersects =
      yi > y !== yj > y &&
      x < ((xj - xi) * (y - yi)) / (yj - yi || 0.000001) + xi;

    if (intersects) inside = !inside;
  }

  return inside;
}

function drawPolygon(png, points, color) {
  const minY = Math.floor(Math.min(...points.map(p => p.y)));
  const maxY = Math.ceil(Math.max(...points.map(p => p.y)));
  const minX = Math.floor(Math.min(...points.map(p => p.x)));
  const maxX = Math.ceil(Math.max(...points.map(p => p.x)));

  for (let y = minY; y <= maxY; y++) {
    for (let x = minX; x <= maxX; x++) {
      if (pointInPolygon(x + 0.5, y + 0.5, points)) {
        blendPixel(png, x, y, color);
      }
    }
  }
}

function isoPoint(x, y, z, offsetX, offsetY, scale = 1) {
  return {
    x: offsetX + (x - z) * (tileWidth / 2) * scale,
    y: offsetY + (x + z) * (tileHeight / 2) * scale - y * blockHeight * scale
  };
}

function isCrossModelBlock(blockName) {
  const short = blockName.replace(/^minecraft:/, "");

  return (
    short.includes("flower") ||
    short.includes("sapling") ||
    short.includes("mushroom") ||
    short.includes("fungus") ||
    short.includes("roots") ||
    short.includes("sprouts") ||
    short.includes("grass") ||
    short.includes("fern") ||
    short.includes("bush") ||
    short.includes("dead_bush") ||
    short.includes("torchflower") ||
    short.includes("pitcher_plant")
  );
}

function makeCrossFaces(block, offsetX, offsetY, scale) {
  const { x, y, z, color } = block;

  const p0 = isoPoint(x, y, z, offsetX, offsetY, scale);
  const p1 = isoPoint(x + 1, y, z + 1, offsetX, offsetY, scale);
  const p2 = isoPoint(x, y + 1, z, offsetX, offsetY, scale);
  const p3 = isoPoint(x + 1, y + 1, z + 1, offsetX, offsetY, scale);

  const q0 = isoPoint(x + 1, y, z, offsetX, offsetY, scale);
  const q1 = isoPoint(x, y, z + 1, offsetX, offsetY, scale);
  const q2 = isoPoint(x + 1, y + 1, z, offsetX, offsetY, scale);
  const q3 = isoPoint(x, y + 1, z + 1, offsetX, offsetY, scale);

  return [
    { points: [p2, p3, p1, p0], color: shadeColor(color, 1.02), depth: x + y + z + 2.5 },
    { points: [q2, q3, q1, q0], color: shadeColor(color, 0.95), depth: x + y + z + 2.55 }
  ];
}

function makeCubeFaces(block, offsetX, offsetY, scale) {
  if (isCrossModelBlock(block.name)) {
    return makeCrossFaces(block, offsetX, offsetY, scale);
  }

  const { x, y, z, color } = block;

  const p100 = isoPoint(x + 1, y, z, offsetX, offsetY, scale);
  const p010 = isoPoint(x, y + 1, z, offsetX, offsetY, scale);
  const p110 = isoPoint(x + 1, y + 1, z, offsetX, offsetY, scale);
  const p001 = isoPoint(x, y, z + 1, offsetX, offsetY, scale);
  const p101 = isoPoint(x + 1, y, z + 1, offsetX, offsetY, scale);
  const p011 = isoPoint(x, y + 1, z + 1, offsetX, offsetY, scale);
  const p111 = isoPoint(x + 1, y + 1, z + 1, offsetX, offsetY, scale);

  return [
    { points: [p010, p110, p111, p011], color: shadeColor(color, 1.15), depth: x + y + z + 3 },
    { points: [p001, p011, p111, p101], color: shadeColor(color, 0.82), depth: x + y + z + 2 },
    { points: [p100, p110, p111, p101], color: shadeColor(color, 0.96), depth: x + y + z + 2.1 }
  ];
}

function collectBlocksFromStructure(structure) {
  const palette = getPalette(structure);
  const blocks = [];

  for (const block of structure.blocks ?? []) {
    const state = palette[block.state];
    const blockName = getBlockNameFromPaletteEntry(state);

    if (!blockName || IGNORED_BLOCKS.has(blockName)) continue;

    const pos = block.pos ?? block.position;
    if (!Array.isArray(pos) || pos.length < 3) continue;

    blocks.push({
      x: Number(pos[0]),
      y: Number(pos[1]),
      z: Number(pos[2]),
      name: blockName,
      color: getBlockColor(blockName)
    });
  }

  return blocks;
}

function normalizeBlocks(blocks) {
  if (blocks.length === 0) return blocks;

  const minX = Math.min(...blocks.map(b => b.x));
  const minY = Math.min(...blocks.map(b => b.y));
  const minZ = Math.min(...blocks.map(b => b.z));

  return blocks.map(block => ({
    ...block,
    x: block.x - minX,
    y: block.y - minY,
    z: block.z - minZ
  }));
}

function computeBounds(blocks, scale = 1) {
  let minX = Infinity;
  let maxX = -Infinity;
  let minY = Infinity;
  let maxY = -Infinity;

  const update = point => {
    if (point.x < minX) minX = point.x;
    if (point.x > maxX) maxX = point.x;
    if (point.y < minY) minY = point.y;
    if (point.y > maxY) maxY = point.y;
  };

  for (const block of blocks) {
    update(isoPoint(block.x, block.y, block.z, 0, 0, scale));
    update(isoPoint(block.x + 1, block.y, block.z, 0, 0, scale));
    update(isoPoint(block.x, block.y + 1, block.z, 0, 0, scale));
    update(isoPoint(block.x + 1, block.y + 1, block.z, 0, 0, scale));
    update(isoPoint(block.x, block.y, block.z + 1, 0, 0, scale));
    update(isoPoint(block.x + 1, block.y, block.z + 1, 0, 0, scale));
    update(isoPoint(block.x, block.y + 1, block.z + 1, 0, 0, scale));
    update(isoPoint(block.x + 1, block.y + 1, block.z + 1, 0, 0, scale));
  }

  if (!Number.isFinite(minX)) {
    return { minX: 0, maxX: 1, minY: 0, maxY: 1 };
  }

  return { minX, maxX, minY, maxY };
}

function fillBackground(png) {
  if (transparentBackground) return;

  for (let y = 0; y < png.height; y++) {
    for (let x = 0; x < png.width; x++) {
      blendPixel(png, x, y, { r: 16, g: 24, b: 32, a: 255 });
    }
  }
}

function renderBlocksToPng(blocks) {
  blocks = normalizeBlocks(blocks);

  if (blocks.length === 0) {
    const png = new PNG({ width: 32, height: 32 });
    fillBackground(png);
    return PNG.sync.write(png);
  }

  const baseBounds = computeBounds(blocks, 1);
  const baseWidth = baseBounds.maxX - baseBounds.minX + padding * 2;
  const baseHeight = baseBounds.maxY - baseBounds.minY + padding * 2;

  const scale = Math.min(1, maxImageSize / Math.max(baseWidth, baseHeight));
  const bounds = computeBounds(blocks, scale);

  const width = Math.max(1, Math.ceil(bounds.maxX - bounds.minX + padding * 2));
  const height = Math.max(1, Math.ceil(bounds.maxY - bounds.minY + padding * 2));

  const png = new PNG({ width, height });
  fillBackground(png);

  const offsetX = padding - bounds.minX;
  const offsetY = padding - bounds.minY;

  const faces = [];
  for (const block of blocks) {
    faces.push(...makeCubeFaces(block, offsetX, offsetY, scale));
  }

  faces.sort((a, b) => a.depth - b.depth);

  for (const face of faces) {
    drawPolygon(png, face.points, face.color);
  }

  return PNG.sync.write(png);
}

async function loadBlocksForFiles(files) {
  const allBlocks = [];

  for (const file of files) {
    const structure = await readNbtFile(file);
    allBlocks.push(...collectBlocksFromStructure(structure));
  }

  return allBlocks;
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
  const groups = await getWorldgenStructureGroups();

  if (groups.size === 0) {
    for (const [key, value] of getDirectStructureGroups()) {
      groups.set(key, value);
    }
  }

  console.log(`Found ${groups.size} rendered structure group(s).`);
  console.log(`Read ${stats.poolsRead} template pool(s), followed ${stats.jigsawPoolsFollowed} jigsaw pool reference(s).`);

  const validOutputFiles = new Set();

  for (const group of groups.values()) {
    group.files.sort();

    const blocks = await loadBlocksForFiles(group.files);
    const outputPath = path.join(outputRoot, group.namespace, `${group.outputName}.png`);

    validOutputFiles.add(path.normalize(outputPath));

    fs.mkdirSync(path.dirname(outputPath), { recursive: true });
    fs.writeFileSync(outputPath, renderBlocksToPng(blocks));
    stats.mainImages++;

    const mainSize = fs.statSync(outputPath).size;
    console.log(`Generated ${outputPath} from ${group.files.length} structure part(s), ${mainSize} bytes`);
  }

  if (groups.size === 0) {
    console.warn("No structure groups were found.");
  }

  console.log(`Generated ${stats.mainImages} preview image(s).`);
  removeStaleOutputFiles(validOutputFiles);
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});
