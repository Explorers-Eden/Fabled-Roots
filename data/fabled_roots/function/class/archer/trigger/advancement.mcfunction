advancement revoke @s only fabled_roots:archer_hit_with_arrow
# Paused (in game dimensions, see Nice Control Center): no class ability here.
execute if entity @s[tag=fabled_roots.paused] run return fail

scoreboard players set @s fabled_roots.exp.class_ability 1

execute as @e[type=!#fabled_roots:non_living,distance=..128] unless predicate fabled_roots:entity/has_no_hurttime run effect give @s minecraft:wind_charged 10 0 false