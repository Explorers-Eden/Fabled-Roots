$summon wind_charge ^ ^1 ^2 {Tags:["fabled_roots.breeze_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot] remove fabled_roots.breeze_shot

$summon wind_charge ^.5 ^1 ^1.5 {Tags:["fabled_roots.breeze_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot] remove fabled_roots.breeze_shot

$summon wind_charge ^-.5 ^1 ^1.5 {Tags:["fabled_roots.breeze_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot] remove fabled_roots.breeze_shot

$summon wind_charge ^1 ^1 ^1 {Tags:["fabled_roots.breeze_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot] remove fabled_roots.breeze_shot

$summon wind_charge ^-1 ^1 ^1 {Tags:["fabled_roots.breeze_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:wind_charge,tag=fabled_roots.breeze_shot] remove fabled_roots.breeze_shot
