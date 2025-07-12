$execute if score @s fabled_roots.exp.class_ability matches 1.. if predicate {"condition":"minecraft:random_chance","chance":0.25} run experience add @s $(exp) points

scoreboard players set @s fabled_roots.exp.class_ability 0
