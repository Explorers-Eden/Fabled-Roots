advancement revoke @s only fabled_roots:hit_with_wooden_hatchet
tag @s add fabled_roots.threw_hatchet

execute as @e[type=!#fabled_roots:non_living,distance=..128] unless predicate fabled_roots:entity/has_no_hurttime run damage @s 0.75 minecraft:player_attack by @p[tag=fabled_roots.threw_hatchet]
execute as @s[tag=fabled_roots.oakhearted] run execute as @e[type=!#fabled_roots:non_living,distance=..128] unless predicate fabled_roots:entity/has_no_hurttime run effect give @s minecraft:weakness 3 1 false

tag @s remove fabled_roots.threw_hatchet