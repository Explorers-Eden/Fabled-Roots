function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"orebringer",race_cap:"Orebringer"}

tag @s add fabled_roots.orebringer
team join fabled_roots.orebringer
tag @s add fabled_roots.has_race

waypoint modify @s style set fabled_roots:player
waypoint modify @s color hex 857A6F

execute store result storage eden:temp fabled_roots.player_size float 0.01 run random value 75..90
function fabled_roots:set_player_size with storage eden:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:armor_toughness base set 3
attribute @s minecraft:gravity base set 0.1

dialog show @s fabled_roots:class_selection
