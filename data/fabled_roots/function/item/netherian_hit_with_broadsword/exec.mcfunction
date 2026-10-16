$summon small_fireball ^ ^1.5 ^.2 {ExplosionPower:1b,life:20,Tags:["fabled_roots.broadsword_fireball"],owner:$(UUID)}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function fabled_roots:util/store_motion
data modify entity @n[type=minecraft:small_fireball,tag=fabled_roots.broadsword_fireball,distance=..4] Motion set from storage eden:temp fabled_roots.motion
tag @e[type=minecraft:small_fireball,tag=fabled_roots.broadsword_fireball] remove fabled_roots.broadsword_fireball