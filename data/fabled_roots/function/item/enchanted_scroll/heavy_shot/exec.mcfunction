$summon tnt ^ ^1 ^.5 {fuse:30,explosion_power:3,Tags:["fabled_roots.heavy_shot"],block_state:{Name:"minecraft:heavy_core"},owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:tnt,tag=fabled_roots.heavy_shot] Motion set from entity @s Pos
tag @e[type=minecraft:tnt,tag=fabled_roots.heavy_shot] remove fabled_roots.heavy_shot

$summon tnt ^-1.5 ^1 ^.5 {fuse:30,explosion_power:3,Tags:["fabled_roots.heavy_shot"],block_state:{Name:"minecraft:heavy_core"},owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:tnt,tag=fabled_roots.heavy_shot] Motion set from entity @s Pos
tag @e[type=minecraft:tnt,tag=fabled_roots.heavy_shot] remove fabled_roots.heavy_shot

$summon tnt ^1.5 ^1 ^.5 {fuse:30,explosion_power:3,Tags:["fabled_roots.heavy_shot"],block_state:{Name:"minecraft:heavy_core"},owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:tnt,tag=fabled_roots.heavy_shot] Motion set from entity @s Pos
tag @e[type=minecraft:tnt,tag=fabled_roots.heavy_shot] remove fabled_roots.heavy_shot