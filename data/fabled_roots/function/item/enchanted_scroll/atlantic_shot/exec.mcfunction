$summon trident ^ ^1 ^1.5 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^.5 ^1 ^1 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^-.5 ^1 ^1 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^1 ^1 ^.5 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^-1 ^1 ^.5 {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^1.5 ^1 ^ {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

$summon trident ^-1.5 ^1 ^ {pickup:0b,life:10,damage:8d,Tags:["fabled_roots.atlantic_shot"],owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^2 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:trident,tag=fabled_roots.atlantic_shot] Motion set from entity @s Pos
tag @e[type=minecraft:trident,tag=fabled_roots.atlantic_shot] remove fabled_roots.atlantic_shot

execute positioned 0.0 0.0 0.0 run kill @e[type=area_effect_cloud,distance=..2]