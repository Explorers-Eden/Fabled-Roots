const fs = require("fs");

const input = "wiki/enchantments.json";
const output = "wiki/enchantments.md";

if (!fs.existsSync(input)) {
  console.error("Missing enchantments.json");
  process.exit(1);
}

const data = JSON.parse(fs.readFileSync(input, "utf8"));

let md = "# Enchantments\n\n";

for (const ench of data) {
  md += `## ${ench.name ?? "Unknown"}\n\n`;
  md += `- ID: ${ench.id ?? "?"}\n\n`;
}

fs.writeFileSync(output, md);
console.log("Generated enchantments.md");
