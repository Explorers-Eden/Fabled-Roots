team join fabled_roots.npc @s
execute unless entity @e[distance=..1,type=minecraft:villager,tag=fabled_roots.npc.base] run function fabled_roots:npc/behavior/kill
$execute if predicate {"condition":"minecraft:random_chance","chance":0.05} run playsound minecraft:entity.villager.ambient ambient @a ~ ~ ~ 0.7 $(pitch)