##one-time update of race attributes changed in v3.5 for players who picked their race before
tag @s add fabled_roots.migrated.v3_5

execute as @s[tag=fabled_roots.netherian] run attribute @s minecraft:attack_speed base reset
execute as @s[tag=fabled_roots.netherian] run attribute @s minecraft:attack_speed modifier add fabled_roots:netherian_speed -0.25 add_multiplied_total
