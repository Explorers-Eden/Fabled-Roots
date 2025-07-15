execute if predicate {"condition":"minecraft:random_chance","chance":0.05} run experience add @s -1 levels

$execute if items entity @s armor.* #fabled_roots:custom_item_base[minecraft:custom_data~{fabled_roots:{stronger_together: 1b}}] run effect give @e[type=player,tag=fabled_roots.$(race),distance=..24] minecraft:strength 10 1 true
$execute if items entity @s armor.* #fabled_roots:custom_item_base[minecraft:custom_data~{fabled_roots:{feast_together: 1b}}] run effect give @e[type=player,tag=fabled_roots.$(race),distance=..24] minecraft:saturation 10 0 true
