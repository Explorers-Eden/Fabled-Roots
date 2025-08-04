$summon ender_pearl ^ ^1 ^1 {Tags:["fabled_roots.ender_lure"],Owner:[I;$(uuid0),$(uuid1),$(uuid2),$(uuid3)],Item:{id:"minecraft:music_disc_5",count:1,components:{"minecraft:item_model":"fabled_roots:enchanted_scroll"}}}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^0.5 ^1.25 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:ender_pearl,tag=fabled_roots.ender_lure] Motion set from entity @s Pos
tag @e[type=minecraft:ender_pearl,tag=fabled_roots.ender_lure] remove fabled_roots.ender_lure

execute positioned 0.0 0.0 0.0 run kill @e[type=area_effect_cloud,distance=..2]