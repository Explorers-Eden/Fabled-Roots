advancement revoke @s only fabled_roots:archer_hit_with_arrow

scoreboard players set @s fabled_roots.exp.class_ability 1

execute as @e[type=!#eden:non_living,distance=..64] unless predicate eden:entity/has_no_hurttime run effect give @s minecraft:wind_charged 10 0 false