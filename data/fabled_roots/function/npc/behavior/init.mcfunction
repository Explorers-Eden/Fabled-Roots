schedule function fabled_roots:npc/behavior/init 1s

execute as @e[type=minecraft:mannequin,tag=fabled_roots.npc.mannequin] at @s run function fabled_roots:npc/behavior/exec/mannequin with entity @s data
execute as @e[type=minecraft:villager,tag=fabled_roots.npc.base] at @s run function fabled_roots:npc/behavior/exec/base

execute as @e[type=minecraft:villager,tag=fabled_roots.npc.base] at @s run function fabled_roots:npc/behavior/exec/set_profession with entity @s data