advancement revoke @s only fabled_roots:survivor_taken_dmg
# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail
execute if predicate {"type":"minecraft:random_chance","chance":0.25} run effect give @s minecraft:regeneration 2 1 true

scoreboard players set @s fabled_roots.exp.class_ability 1