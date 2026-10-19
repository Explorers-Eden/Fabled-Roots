$summon tnt ^ ^1 ^.5 {fuse:30,explosion_power:3,Tags:["fabled_roots.heavy_shot"],block_state:{id:"minecraft:heavy_core"},owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:tnt,tag=fabled_roots.heavy_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:tnt,tag=fabled_roots.heavy_shot] remove fabled_roots.heavy_shot

$summon tnt ^-1.5 ^1 ^.5 {fuse:30,explosion_power:3,Tags:["fabled_roots.heavy_shot"],block_state:{id:"minecraft:heavy_core"},owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:tnt,tag=fabled_roots.heavy_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:tnt,tag=fabled_roots.heavy_shot] remove fabled_roots.heavy_shot

$summon tnt ^1.5 ^1 ^.5 {fuse:30,explosion_power:3,Tags:["fabled_roots.heavy_shot"],block_state:{id:"minecraft:heavy_core"},owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:tnt,tag=fabled_roots.heavy_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:tnt,tag=fabled_roots.heavy_shot] remove fabled_roots.heavy_shot
