summon wolf ~1 ~.5 ~ {Tags:["fabled_roots.lupine_echo","mob_manager.settings.exclude"],Passengers:[{id:"minecraft:area_effect_cloud",Duration:1200,custom_particle:{type:"block",block_state:"minecraft:air"}}],}
summon wolf ~-1 ~.5 ~ {Tags:["fabled_roots.lupine_echo","mob_manager.settings.exclude"],Passengers:[{id:"minecraft:area_effect_cloud",Duration:1200,custom_particle:{type:"block",block_state:"minecraft:air"}}],}

execute as @e[type=wolf,tag=!fabled_roots.anger_set,tag=fabled_roots.lupine_echo,distance=..24] at @s run data modify entity @s AngerTime set value 1200
execute as @e[type=wolf,tag=!fabled_roots.anger_set,tag=fabled_roots.lupine_echo,distance=..24] at @s run data modify entity @s AngryAt set from entity @n[type=#fabled_roots:scroll_targets] UUID
tag @e[type=wolf,tag=!fabled_roots.anger_set,tag=fabled_roots.lupine_echo,distance=..24] add fabled_roots.anger_set