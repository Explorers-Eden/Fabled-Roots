execute if entity @e[type=player,tag=fabled_roots.endling,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if entity @e[type=player,tag=fabled_roots.endling,distance=1..32] if items entity @s armor.* #fabled_roots:custom_item_base[minecraft:custom_data~{fabled_roots:{stronger_together: 1b}}] run effect give @e[type=player,tag=fabled_roots.endling,distance=..32] minecraft:strength 2 1 true

execute if dimension minecraft:the_end run effect give @s minecraft:strength 2 0 true
execute if dimension minecraft:the_end run effect give @s minecraft:luck 2 0 true

execute if predicate fabled_roots:entity/is_crouching run effect give @e[distance=0.1..3] minecraft:levitation 2 0 false
execute if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.365,0.227,0.608],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal