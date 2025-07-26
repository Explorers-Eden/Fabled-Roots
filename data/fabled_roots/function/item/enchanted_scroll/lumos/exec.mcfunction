execute anchored eyes positioned ~ ~1 ~ run summon area_effect_cloud ~ ~ ~ {Duration:1200,Tags:["fabled_roots.lumos"],custom_particle:{type:"block",block_state:"minecraft:air"}}
execute anchored eyes positioned ~ ~1 ~ run summon marker ~ ~ ~ {Tags:["fabled_roots.lumos"]}

execute anchored eyes positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]

execute anchored eyes positioned ~ ~1 ~2 if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]
execute anchored eyes positioned ~ ~1 ~-2 if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]
execute anchored eyes positioned ~2 ~1 ~ if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]
execute anchored eyes positioned ~-2 ~1 ~ if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]

execute anchored eyes positioned ~ ~1 ~4 if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]
execute anchored eyes positioned ~ ~1 ~-4 if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]
execute anchored eyes positioned ~4 ~1 ~ if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]
execute anchored eyes positioned ~-4 ~1 ~ if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light[level=15,waterlogged=false]