execute if entity @e[type=player,tag=fabled_roots.dunesworn,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if biome ~ ~ ~ #minecraft:has_structure/desert_pyramid run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ #minecraft:has_structure/desert_pyramid run effect give @s minecraft:luck 2 0 true

execute if predicate eden:entity/is_crouching run effect give @e[distance=0.1..4] minecraft:hunger 2 0 false
execute if predicate eden:entity/is_crouching run particle dust{color:[0.761,0.655,0.427],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal