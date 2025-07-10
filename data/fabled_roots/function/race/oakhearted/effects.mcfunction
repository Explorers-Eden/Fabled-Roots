execute if entity @e[type=player,tag=fabled_roots.oakhearted,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if biome ~ ~ ~ #minecraft:is_forest run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ #minecraft:is_forest run effect give @s minecraft:luck 2 0 true

execute if predicate eden:entity/is_crouching run effect give @e[distance=0.1..4] minecraft:weakness 2 0 false
execute if predicate eden:entity/is_crouching run particle dust{color:[0.357,0.482,0.302],scale:1} ~ ~.5 ~ .5 .5 .5 1 5 normal