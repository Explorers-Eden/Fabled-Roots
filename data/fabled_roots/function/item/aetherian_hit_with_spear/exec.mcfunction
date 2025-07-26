$summon wind_charge ^ ^1.5 ^.2 {Tags:["fabled_roots.spear_charge"],owner:$(UUID)}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.spear_charge] Motion set from entity @s Pos
tag @e[type=minecraft:wind_charge,tag=fabled_roots.spear_charge] remove fabled_roots.spear_charge