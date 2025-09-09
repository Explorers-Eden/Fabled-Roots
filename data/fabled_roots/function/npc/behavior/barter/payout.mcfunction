scoreboard players reset @s fabled_roots.npc.bartering.timer
item replace entity @s weapon.mainhand with minecraft:air
$playsound fabled_roots:entity.descendant.celebrate ambient @a ~ ~ ~ 0.5 $(pitch)
particle minecraft:happy_villager ~ ~1 ~ .4 .5 .4 1 10

execute if data entity @s data{race:"aetherian"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/aetherian
execute if data entity @s data{race:"dunesworn"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/dunesworn
execute if data entity @s data{race:"endling"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/endling
execute if data entity @s data{race:"frostborne"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/frostborne
execute if data entity @s data{race:"moonshroud"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/moonshroud
execute if data entity @s data{race:"netherian"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/netherian
execute if data entity @s data{race:"oakhearted"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/oakhearted
execute if data entity @s data{race:"orebringer"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/orebringer
execute if data entity @s data{race:"palehearted"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/palehearted
execute if data entity @s data{race:"turtlekin"} run return run loot spawn ~ ~1 ~ loot fabled_roots:gameplay/descendant_bartering/turtlekin