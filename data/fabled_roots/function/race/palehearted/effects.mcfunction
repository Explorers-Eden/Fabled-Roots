execute if entity @e[type=player,tag=fabled_roots.palehearted,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if entity @e[type=player,tag=fabled_roots.palehearted,distance=1..32] if items entity @s armor.* #fabled_roots:custom_item_base[minecraft:custom_data~{fabled_roots:{stronger_together: 1b}}] run effect give @e[type=player,tag=fabled_roots.palehearted,distance=..32] minecraft:strength 2 1 true

execute if biome ~ ~ ~ minecraft:pale_garden run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ minecraft:pale_garden run effect give @s minecraft:luck 2 0 true

execute if predicate fabled_roots:entity/is_crouching run effect give @s minecraft:night_vision 15 0 true
execute if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.910,0.855,0.855],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal