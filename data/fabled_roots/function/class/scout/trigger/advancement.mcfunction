advancement revoke @s only fabled_roots:scout_used_spyglass

#execute if score @s fabled_roots.scout.pos matches 64.. run return run scoreboard players set @s fabled_roots.scout.pos 0
#execute store result storage eden:temp fabled_roots.spyglass_pos int 1 run scoreboard players add @s fabled_roots.scout.pos 1
#function fabled_roots:class/scout/spyglass with storage eden:temp fabled_roots
execute if score @s fabled_roots.scout.timer matches ..9 run return fail
scoreboard players set @s fabled_roots.scout.timer.active 1
scoreboard players set @s fabled_roots.scout.timer 1

summon lingering_potion ^ ^-.5 ^2 {Tags:["fabled_roots.scout_glowing"],Item:{id:"minecraft:lingering_potion",count:1,components:{"minecraft:potion_contents":{custom_color:16777215,custom_effects:[{id:"minecraft:glowing",amplifier:1,duration:200,show_particles:0b},{id:"minecraft:slowness",amplifier:2,duration:200,show_particles:0b}]}}}}
execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^.5 ^10 summon minecraft:area_effect_cloud run data modify entity @n[type=minecraft:lingering_potion,tag=fabled_roots.scout_glowing] Motion set from entity @s Pos

execute positioned 0.0 0.0 0.0 run kill @e[type=area_effect_cloud,distance=..15]
