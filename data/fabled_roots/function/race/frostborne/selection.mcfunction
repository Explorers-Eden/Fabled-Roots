function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"frostborne",race_cap:"Frostborne"}

tag @s add fabled_roots.frostborne
team join fabled_roots.frostborne
tag @s add fabled_roots.has_race

waypoint modify @s style set fabled_roots:player
waypoint modify @s color hex A9D6E5

execute store result storage fabled_roots:temp fabled_roots.player_size float 0.01 run random value 95..105
function fabled_roots:set_player_size with storage fabled_roots:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:movement_speed base set 0.11
attribute @s minecraft:submerged_mining_speed base set 0.1

dialog show @s fabled_roots:class_selection
