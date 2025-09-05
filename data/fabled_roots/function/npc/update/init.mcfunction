schedule function fabled_roots:npc/update/init 1s

execute as @e[type=minecraft:mannequin,tag=fabled_roots.npc.mannequin] at @s run function fabled_roots:npc/update/exec/mannequin
execute as @e[type=minecraft:villager,tag=fabled_roots.npc.base] at @s run function fabled_roots:npc/update/exec/base with entity @s data
execute as @e[type=minecraft:armor_stand,tag=fabled_roots.npc.mount] at @s run function fabled_roots:npc/update/exec/mount