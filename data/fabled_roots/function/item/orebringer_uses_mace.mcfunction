schedule function fabled_roots:item/orebringer_uses_mace 1s

execute as @a[tag=fabled_roots.orebringer] if items entity @s weapon.mainhand minecraft:mace run attribute @s minecraft:attack_speed modifier add fabled_roots:orebringer_mace_speed 0.5 add_value
execute as @a unless items entity @s weapon.mainhand minecraft:mace run attribute @s minecraft:attack_speed modifier remove fabled_roots:orebringer_mace_speed 
