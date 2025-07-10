$execute if score @s fabled_roots.exp.player matches 1.. run experience add @s $(exp) points
scoreboard players set @s fabled_roots.exp.player 0

execute if predicate {"condition":"minecraft:random_chance","chance":0.15} run return run effect clear @s minecraft:poison
execute if predicate {"condition":"minecraft:random_chance","chance":0.15} run return run effect clear @s minecraft:slowness
execute if predicate {"condition":"minecraft:random_chance","chance":0.15} run return run effect clear @s minecraft:weakness