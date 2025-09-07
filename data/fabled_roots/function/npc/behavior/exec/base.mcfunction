data remove entity @s Brain.memories.minecraft:home
data modify entity @s Age set value 2400
team join fabled_roots.npc @s
execute unless entity @e[distance=..1,type=minecraft:mannequin,tag=fabled_roots.npc.mannequin] run function fabled_roots:npc/behavior/kill