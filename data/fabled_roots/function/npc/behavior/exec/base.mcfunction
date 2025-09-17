data remove entity @s Brain.memories.minecraft:home
execute unless entity @e[distance=..2,type=minecraft:mannequin,tag=fabled_roots.npc.mannequin] run function fabled_roots:npc/behavior/kill
