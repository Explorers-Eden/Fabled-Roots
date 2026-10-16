$summon wind_charge ^ ^1.5 ^.2 {Tags:["fabled_roots.spear_charge"],owner:$(UUID)}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.spear_charge,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:wind_charge,tag=fabled_roots.spear_charge] remove fabled_roots.spear_charge