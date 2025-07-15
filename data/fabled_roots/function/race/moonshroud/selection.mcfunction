function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"moonshroud",race_cap:"Moonshroud"}

tag @s add fabled_roots.moonshroud
team join fabled_roots.moonshroud
tag @s add fabled_roots.has_race

execute store result storage fabled_roots:temp fabled_roots.player_size float 0.01 run random value 85..100
function fabled_roots:set_player_size with storage fabled_roots:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 0
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:sneaking_speed base set 0.45
attribute @s minecraft:attack_damage base set 0.7

dialog show @s fabled_roots:class_selection
