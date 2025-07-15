schedule function fabled_roots:item/horse_armor_of_roots 1s

execute as @a on vehicle if items entity @s armor.body minecraft:iron_horse_armor[minecraft:custom_data~{fabled_roots:{item: "iron_horse_armor_of_roots"}}] run effect give @s regeneration 2 0 true
execute as @a on vehicle if items entity @s armor.body minecraft:golden_horse_armor[minecraft:custom_data~{fabled_roots:{item: "golden_horse_armor_of_roots"}}] run effect give @s regeneration 2 1 true
execute as @a on vehicle if items entity @s armor.body minecraft:diamond_horse_armor[minecraft:custom_data~{fabled_roots:{item: "diamond_horse_armor_of_roots"}}] run effect give @s regeneration 2 2 true