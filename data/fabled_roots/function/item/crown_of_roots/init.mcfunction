schedule function fabled_roots:item/crown_of_roots/init 1s

execute as @a if items entity @s armor.head #fabled_roots:custom_item_base[minecraft:custom_data~{fabled_roots:{item: "crown_of_roots"}}] at @s run function fabled_roots:item/crown_of_roots/get_exp
