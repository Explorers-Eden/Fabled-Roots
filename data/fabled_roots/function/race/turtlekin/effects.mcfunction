execute if entity @e[type=player,tag=fabled_roots.turtlekin,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if biome ~ ~ ~ #minecraft:is_ocean run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ #minecraft:is_ocean run effect give @s minecraft:luck 2 0 true

execute if predicate eden:entity/is_crouching run effect give @s minecraft:conduit_power 15 0 true
execute if predicate eden:entity/is_crouching run particle dust{color:[0.235,0.573,0.643],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal