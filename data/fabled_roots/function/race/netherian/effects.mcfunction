team join fabled_roots.netherian

execute if entity @e[type=player,tag=fabled_roots.netherian,distance=1..24] run effect give @s minecraft:regeneration 5 0 true
execute if dimension minecraft:the_nether run effect give @s minecraft:strength 2 0 true
execute if dimension minecraft:the_nether run effect give @s minecraft:luck 2 0 true

execute if score @s fabled_roots.dialog_trigger.ability matches 4 run return fail

execute as @s[gamemode=!spectator,scores={fabled_roots.dialog_trigger.ability=1},predicate=fabled_roots:entity/is_crouching] run effect give @s minecraft:fire_resistance 2 0 true
execute as @s[gamemode=!spectator,scores={fabled_roots.dialog_trigger.ability=1},predicate=fabled_roots:entity/is_crouching] run particle dust{color:[0.698,0.200,0.200],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal

execute as @s[gamemode=!spectator,scores={fabled_roots.dialog_trigger.ability=2},predicate=fabled_roots:entity/is_jumping] run effect give @s minecraft:fire_resistance 2 0 true
execute as @s[gamemode=!spectator,scores={fabled_roots.dialog_trigger.ability=2},predicate=fabled_roots:entity/is_jumping] run particle dust{color:[0.698,0.200,0.200],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal

execute as @s[gamemode=!spectator,scores={fabled_roots.dialog_trigger.ability=3},predicate=fabled_roots:entity/is_sprinting] run effect give @s minecraft:fire_resistance 2 0 true
execute as @s[gamemode=!spectator,scores={fabled_roots.dialog_trigger.ability=3},predicate=fabled_roots:entity/is_sprinting] run particle dust{color:[0.698,0.200,0.200],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal