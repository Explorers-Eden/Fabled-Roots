advancement revoke @s only fabled_roots:builder_placed_block
# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail

scoreboard players set @s fabled_roots.exp.class_ability 1
