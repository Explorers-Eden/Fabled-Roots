function fabled_roots:remove/race
function fabled_roots:send_join_msg {race:"endling",race_cap:"Endling"}

tag @s add fabled_roots.endling
team join fabled_roots.endling
tag @s add fabled_roots.has_race

execute store result storage eden:temp fabled_roots.player_size float 0.01 run random value 105..120
function fabled_roots:set_player_size with storage eden:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:gravity base set 0.04
attribute @s minecraft:safe_fall_distance base set 3.5
attribute @s minecraft:fall_damage_multiplier base set 1.5

dialog show @s fabled_roots:class_selection
