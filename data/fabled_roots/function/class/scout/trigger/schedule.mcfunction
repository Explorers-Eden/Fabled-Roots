effect give @e[type=#fabled_roots:hostile_mobs,distance=..8] glowing 2 0 true
$execute if predicate {"condition":"minecraft:random_chance","chance":0.025} if entity @e[type=#fabled_roots:scout_effect,distance=..8] run experience add @s $(exp) points

execute if score @s fabled_roots.scout.timer.active matches 1.. run scoreboard players add @s fabled_roots.scout.timer 1
execute if score @s fabled_roots.scout.timer.active matches 1.. if score @s fabled_roots.scout.timer matches 10.. run scoreboard players reset @s fabled_roots.scout.timer.active