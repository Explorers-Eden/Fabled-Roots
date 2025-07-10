execute if entity @e[type=player,tag=fabled_roots.netherian,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if dimension minecraft:the_nether run effect give @s minecraft:strength 2 0 true
execute if dimension minecraft:the_nether run effect give @s minecraft:luck 2 0 true

execute if predicate eden:entity/is_crouching run effect give @s minecraft:fire_resistance 31 0 true
execute if predicate eden:entity/is_crouching run particle dust{color:[0.698,0.200,0.200],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal