execute if entity @e[type=player,tag=fabled_roots.moonshroud,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if predicate eden:time/night_time run effect give @s minecraft:strength 2 0 true
execute if predicate eden:time/night_time run effect give @s minecraft:luck 2 0 true

execute if predicate eden:entity/is_crouching run effect give @s minecraft:invisibility 2 0 true
execute if predicate eden:entity/is_crouching if predicate {"condition":"minecraft:random_chance","chance":0.25} run particle dust{color:[0.690,0.718,0.839],scale:1} ~ ~ ~ .5 .5 .5 1 3 normal