##one-time update of race attributes changed in v3.1 for players who picked their race before
tag @s add fabled_roots.migrated.v3_1

execute as @s[tag=fabled_roots.netherian] run attribute @s minecraft:attack_speed base set 3
execute as @s[tag=fabled_roots.netherian,tag=!fabled_roots.miner] run attribute @s minecraft:block_break_speed base reset
execute as @s[tag=fabled_roots.netherian,tag=fabled_roots.miner] run attribute @s minecraft:block_break_speed base set 1.5
execute as @s[tag=fabled_roots.orebringer] run attribute @s minecraft:gravity base set 0.096
execute as @s[tag=fabled_roots.oakhearted] run attribute @s minecraft:jump_strength base set 0.63
execute as @s[tag=fabled_roots.palehearted] run attribute @s minecraft:jump_strength base set 0.525
