function fabled_roots:remove/race
function fabled_roots:send_join_msg {race:"aetherian",race_cap:"Aetherian"}

tag @s add fabled_roots.aetherian
team join fabled_roots.aetherian
tag @s add fabled_roots.has_race

execute store result storage eden:temp fabled_roots.player_size float 0.01 run random value 90..110
function fabled_roots:set_player_size with storage eden:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:safe_fall_distance base set 30
attribute @s minecraft:armor base set -3

dialog show @s fabled_roots:class_selection