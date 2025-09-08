item modify entity @s container.0 fabled_roots:detract_item
item replace entity @n[type=minecraft:mannequin,distance=..1,tag=fabled_roots.npc.generic] weapon.mainhand with minecraft:lapis_lazuli
execute at @n[type=minecraft:mannequin,distance=..1,tag=fabled_roots.npc.generic] run particle minecraft:happy_villager ~ ~1 ~ .2 .4 .2 0 10
execute at @n[type=minecraft:mannequin,distance=..1,tag=fabled_roots.npc.generic] run playsound minecraft:entity.item.pickup ambient @a ~ ~ ~ .5 1
effect give @n[type=minecraft:villager,distance=..1,tag=fabled_roots.npc.base] minecraft:slowness 5 255 true