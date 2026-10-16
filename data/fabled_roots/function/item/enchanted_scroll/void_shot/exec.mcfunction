summon shulker_bullet ^ ^1 ^.5 {Steps:256,Tags:["fabled_roots.void_shot"]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot] remove fabled_roots.void_shot

summon shulker_bullet ^.5 ^1 ^.5 {Steps:256,Tags:["fabled_roots.void_shot"]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot] remove fabled_roots.void_shot

summon shulker_bullet ^1 ^1 ^.5 {Steps:256,Tags:["fabled_roots.void_shot"]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot] remove fabled_roots.void_shot

summon shulker_bullet ^-.5 ^1 ^.5 {Steps:256,Tags:["fabled_roots.void_shot"]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot] remove fabled_roots.void_shot

summon shulker_bullet ^-1 ^1 ^.5 {Steps:256,Tags:["fabled_roots.void_shot"]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:shulker_bullet,tag=fabled_roots.void_shot] remove fabled_roots.void_shot
