$summon wind_charge ^ ^1 ^2 {acceleration_power:0.01d,Tags:["fabled_roots.vehicle","fabled_roots.flying_nimbus"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^.01 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.flying_nimbus,distance=..4] Motion set from storage eden:temp fabled_roots.motion
ride @s mount @n[type=wind_charge,tag=fabled_roots.flying_nimbus]
tag @e[type=minecraft:wind_charge,tag=fabled_roots.flying_nimbus] remove fabled_roots.flying_nimbus
