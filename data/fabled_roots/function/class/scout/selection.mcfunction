function fabled_roots:remove/class

tag @s add fabled_roots.scout
tag @s add fabled_roots.has_class

stopsound @s
advancement revoke @s only fabled_roots:on_join

attribute @s minecraft:waypoint_receive_range base set 256

particle minecraft:poof ~ ~.6 ~ .5 .5 .5 0 100
particle minecraft:end_rod ~ ~.6 ~ 1 1 1 0.01 50
particle minecraft:scrape ~ ~.6 ~ .8 .8 .8 0.3 50
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.2 2