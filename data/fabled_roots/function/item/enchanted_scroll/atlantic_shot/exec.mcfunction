$summon trident ^ ^1 ^1.5 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^.5 ^1 ^1 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^-.5 ^1 ^1 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^1 ^1 ^.5 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^-1 ^1 ^.5 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot
