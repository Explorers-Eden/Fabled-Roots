function fabled_roots:remove/class

tag @s add fabled_roots.archer
tag @s add fabled_roots.has_class

execute unless score @s fabled_roots.received_equip matches 1 run loot give @s loot fabled_roots:gameplay/starter_equipment/archer
scoreboard players set @s fabled_roots.received_equip 1

stopsound @s
particle minecraft:poof ~ ~.6 ~ .5 .5 .5 0 100
particle minecraft:end_rod ~ ~.6 ~ 1 1 1 0.01 50
particle minecraft:scrape ~ ~.6 ~ .8 .8 .8 0.3 50
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.2 2