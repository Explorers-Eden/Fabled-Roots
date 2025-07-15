execute if entity @e[type=player,tag=fabled_roots.aetherian,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if predicate {"condition":"minecraft:location_check","predicate":{"position":{"y":{"min":200}}}} run effect give @s minecraft:strength 2 0 true
execute if predicate {"condition":"minecraft:location_check","predicate":{"position":{"y":{"min":200}}}} run effect give @s minecraft:luck 2 0 true

execute if predicate fabled_roots:entity/is_crouching run effect give @s minecraft:levitation 2 0 true
execute if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.831,0.945,1.000],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal