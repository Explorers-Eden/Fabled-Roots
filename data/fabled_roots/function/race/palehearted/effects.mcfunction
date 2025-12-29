execute if entity @e[type=player,tag=fabled_roots.palehearted,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if biome ~ ~ ~ minecraft:pale_garden run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ minecraft:pale_garden run effect give @s minecraft:luck 2 0 true

execute as @s[gamemode=!spectator] if predicate fabled_roots:entity/is_crouching run effect give @s minecraft:night_vision 15 0 true
execute as @s[gamemode=!spectator] if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.910,0.855,0.855],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal