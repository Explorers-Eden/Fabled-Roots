import json
import os

INPUT_DIR = "data"
OUTPUT_FILE = "wiki/enchantments.json"

result = []

for root, _, files in os.walk(INPUT_DIR):
    for file in files:
        if file.endswith(".json"):
            path = os.path.join(root, file)

            try:
                with open(path, "r") as f:
                    data = json.load(f)
                    result.append(data)
            except:
                print(f"Skipping invalid JSON: {path}")

os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)

with open(OUTPUT_FILE, "w") as f:
    json.dump(result, f, indent=2)

print("Generated enchantments.json")
