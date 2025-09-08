scoreboard players reset @s fabled_roots.bartering.timer
item replace entity @s weapon.mainhand with minecraft:air
$playsound fabled_roots:entity.descendant.celebrate ambient @a ~ ~ ~ 0.5 $(pitch)

loot spawn ~ ~1 ~ loot fabled_roots:structure/aetherian/common
particle minecraft:happy_villager ~ ~1 ~ .4 .5 .4 0 10