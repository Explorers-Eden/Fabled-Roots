# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail
effect clear @a[distance=..8] minecraft:poison
effect clear @a[distance=..8] minecraft:wither
effect clear @a[distance=..8] minecraft:weakness
effect clear @a[distance=..8] minecraft:slowness
effect clear @a[distance=..8] minecraft:nausea
effect clear @a[distance=..8] minecraft:hunger
effect clear @a[distance=..8] minecraft:blindness

scoreboard players set @s fabled_roots.bard.timer.active 1
scoreboard players set @s fabled_roots.exp.class_ability 1