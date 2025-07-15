execute if entity @e[type=player,tag=fabled_roots.moonshroud,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if entity @e[type=player,tag=fabled_roots.moonshroud,distance=1..32] if items entity @s armor.* #fabled_roots:custom_item_base[minecraft:custom_data~{fabled_roots:{stronger_together: 1b}}] run effect give @e[type=player,tag=fabled_roots.moonshroud,distance=..32] minecraft:strength 2 1 true

execute if predicate fabled_roots:time/night_time run effect give @s minecraft:strength 2 0 true
execute if predicate fabled_roots:time/night_time run effect give @s minecraft:luck 2 0 true

execute if predicate fabled_roots:entity/is_crouching run effect give @s minecraft:invisibility 2 0 true
execute if predicate fabled_roots:entity/is_crouching if predicate {"condition":"minecraft:random_chance","chance":0.25} run particle dust{color:[0.690,0.718,0.839],scale:1} ~ ~ ~ .5 .5 .5 1 3 normal