advancement revoke @s only fabled_roots:hit_with_golden_throwing_knife
tag @s add fabled_roots.threw_knife

execute as @e[type=!#fabled_roots:non_living,distance=..128] unless predicate fabled_roots:entity/has_no_hurttime run damage @s 1 minecraft:player_attack by @p[tag=fabled_roots.threw_knife]
execute as @s[tag=fabled_roots.moonshroud] run execute as @e[type=!#fabled_roots:non_living,distance=..128] unless predicate fabled_roots:entity/has_no_hurttime run effect give @s minecraft:poison 3 2 false

tag @s remove fabled_roots.threw_knife