# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail
effect give @e[type=!#fabled_roots:non_living,distance=0.1..16] minecraft:glowing 10 0 false

scoreboard players set @s fabled_roots.bard.timer.active 1
scoreboard players set @s fabled_roots.exp.class_ability 1