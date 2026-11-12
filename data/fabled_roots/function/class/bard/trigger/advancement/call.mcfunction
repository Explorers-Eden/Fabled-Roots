# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail
tp @e[type=item,distance=..16] @s

scoreboard players set @s fabled_roots.bard.timer.active 1
scoreboard players set @s fabled_roots.exp.class_ability 1