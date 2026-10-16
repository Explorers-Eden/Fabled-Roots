summon shulker_bullet ^ ^1.5 ^.2 {Tags:["fabled_roots.scythe_bullet"]}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.2 ^.75 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:shulker_bullet,tag=fabled_roots.scythe_bullet,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:shulker_bullet,tag=fabled_roots.scythe_bullet] remove fabled_roots.scythe_bullet
