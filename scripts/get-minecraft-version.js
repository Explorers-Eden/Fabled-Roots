const fs = require("fs");

function compareVersionParts(a, b) {
  const normalize = value => String(value)
    .replace(/-(pre|rc)(\d+)$/, ".$2")
    .split(".")
    .map(part => Number(part));

  const aParts = normalize(a);
  const bParts = normalize(b);
  const length = Math.max(aParts.length, bParts.length);

  for (let i = 0; i < length; i++) {
    const av = Number.isFinite(aParts[i]) ? aParts[i] : 0;
    const bv = Number.isFinite(bParts[i]) ? bParts[i] : 0;
    if (av !== bv) return av - bv;
  }

  return String(a).localeCompare(String(b));
}

function isMinecraftLikeVersion(version) {
  return /^(?:1\.\d+(?:\.\d+)?|[2-9]\d\.\d+(?:\.\d+)?)(?:-(?:pre|rc)\d+)?$/.test(String(version));
}

function getLatestVersionFromReleaseInfo() {
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
    if (versionMatch && isMinecraftLikeVersion(versionMatch[1])) {
      versions.push(versionMatch[1]);
    }
  }

  if (versions.length === 0) return null;
  return versions.sort(compareVersionParts).at(-1);
}

console.log(process.env.MC_VERSION || getLatestVersionFromReleaseInfo() || "1.21.4");
