execute if entity @e[type=player,tag=fabled_roots.endling,distance=1..24] run effect give @s minecraft:regeneration 5 0 true
execute if dimension minecraft:the_end run effect give @s minecraft:strength 2 0 true
execute if dimension minecraft:the_end run effect give @s minecraft:luck 2 0 true

execute as @s[gamemode=!spectator] if predicate fabled_roots:entity/is_crouching run effect give @e[type=!#fabled_roots:non_living,distance=0.1..3] minecraft:levitation 2 0 false
execute as @s[gamemode=!spectator] if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.365,0.227,0.608],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal