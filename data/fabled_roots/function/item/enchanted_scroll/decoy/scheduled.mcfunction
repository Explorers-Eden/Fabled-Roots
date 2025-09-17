schedule function fabled_roots:item/enchanted_scroll/decoy/scheduled 1s

scoreboard players add @e[type=minecraft:mannequin,tag=fabled_roots.decoy] fabled_roots.decoy.timer 1
execute as @e[type=minecraft:mannequin,tag=fabled_roots.decoy] if score @s fabled_roots.decoy.timer matches 60.. run kill @s

execute as @e[type=#fabled_roots:hostile_mobs] at @s if entity @e[type=minecraft:mannequin,tag=fabled_roots.decoy,distance=..24] run damage @s 0 minecraft:generic by @n[type=minecraft:mannequin,tag=fabled_roots.decoy,distance=..24]