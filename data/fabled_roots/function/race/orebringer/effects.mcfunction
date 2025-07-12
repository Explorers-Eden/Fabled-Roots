execute if entity @e[type=player,tag=fabled_roots.orebringer,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if predicate {"condition":"minecraft:location_check","predicate":{"position":{"y":{"max":0}}}} run effect give @s minecraft:strength 2 0 true
execute if predicate {"condition":"minecraft:location_check","predicate":{"position":{"y":{"max":0}}}} run effect give @s minecraft:luck 2 0 true

execute if predicate eden:entity/is_crouching run effect give @s minecraft:haste 2 0 true
execute if predicate eden:entity/is_crouching run particle dust{color:[0.522,0.478,0.435],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal