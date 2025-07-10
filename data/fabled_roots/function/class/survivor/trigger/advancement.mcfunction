advancement revoke @s only fabled_roots:survivor_taken_dmg
execute if predicate {"condition":"minecraft:random_chance","chance":0.25} run effect give @s minecraft:regeneration 2 1 true

scoreboard players set @s fabled_roots.exp.player 1