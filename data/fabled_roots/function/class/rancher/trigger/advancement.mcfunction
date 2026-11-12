advancement revoke @s only fabled_roots:rancher_tamed_animal
# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail
advancement revoke @s only fabled_roots:rancher_bred_animal

scoreboard players set @s fabled_roots.exp.class_ability 1