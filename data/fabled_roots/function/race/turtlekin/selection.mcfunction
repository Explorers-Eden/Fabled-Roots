function fabled_roots:remove/race
function fabled_roots:send_join_msg {race:"turtlekin",race_cap:"Turtlekin"}

tag @s add fabled_roots.turtlekin
team join fabled_roots.turtlekin
tag @s add fabled_roots.has_race

execute store result storage eden:temp fabled_roots.player_size float 0.01 run random value 85..110
function fabled_roots:set_player_size with storage eden:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:oxygen_bonus base set 15
attribute @s minecraft:movement_speed base set 0.09

dialog show @s fabled_roots:class_selection
