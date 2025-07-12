$execute if score @s fabled_roots.exp.class_ability matches 1.. run experience add @s $(exp) points
scoreboard players set @s fabled_roots.exp.class_ability 0

effect clear @s minecraft:poison
effect clear @s minecraft:slowness
effect clear @s minecraft:weakness