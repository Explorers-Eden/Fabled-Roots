function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"oakhearted",race_cap:"Oakhearted"}

tag @s add fabled_roots.oakhearted
team join fabled_roots.oakhearted
tag @s add fabled_roots.has_race

waypoint modify @s style set fabled_roots:player
waypoint modify @s color hex 5B7B4D

execute store result storage eden:temp fabled_roots.player_size float 0.01 run random value 100..110
function fabled_roots:set_player_size with storage eden:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:jump_strength base set 0.6
attribute @s minecraft:safe_fall_distance base set 3.5
attribute @s minecraft:burning_time base set 2

dialog show @s fabled_roots:class_selection
