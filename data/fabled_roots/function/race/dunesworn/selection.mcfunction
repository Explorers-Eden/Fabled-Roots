function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"dunesworn",race_cap:"Dunesworn"}

tag @s add fabled_roots.dunesworn
team join fabled_roots.dunesworn
tag @s add fabled_roots.has_race

waypoint modify @s style set fabled_roots:player
waypoint modify @s color hex C2A76D

execute store result storage eden:temp fabled_roots.player_size float 0.01 run random value 85..95
function fabled_roots:set_player_size with storage eden:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:armor base set 3
attribute @s minecraft:knockback_resistance base set -2

dialog show @s fabled_roots:class_selection
