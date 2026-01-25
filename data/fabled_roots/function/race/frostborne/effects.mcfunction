execute if entity @e[type=player,tag=fabled_roots.frostborne,distance=1..24] run effect give @s minecraft:regeneration 5 0 true
execute if biome ~ ~ ~ #minecraft:spawns_snow_foxes run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ #minecraft:spawns_snow_foxes run effect give @s minecraft:luck 2 0 true

execute as @s[gamemode=!spectator] if predicate fabled_roots:entity/is_crouching run effect give @e[distance=0.1..4] minecraft:slowness 2 2 false
execute as @s[gamemode=!spectator] if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.663,0.839,0.898],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal

team join fabled_roots.frostborne