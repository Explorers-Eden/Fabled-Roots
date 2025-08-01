function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"netherian",race_cap:"Netherian"}

tag @s add fabled_roots.netherian
team join fabled_roots.netherian
tag @s add fabled_roots.has_race

waypoint modify @s style set fabled_roots:player
waypoint modify @s color hex B23333

execute store result storage fabled_roots:temp fabled_roots.player_size float 0.01 run random value 90..110
function fabled_roots:set_player_size with storage fabled_roots:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 128

attribute @s minecraft:attack_knockback base set 1
attribute @s minecraft:block_break_speed base set 0.75

dialog show @s fabled_roots:class_selection
