function fabled_roots:remove/race
function fabled_roots:selection_msg {race:"palehearted",race_cap:"Palehearted"}

tag @s add fabled_roots.palehearted
team join fabled_roots.palehearted
tag @s add fabled_roots.has_race

waypoint modify @s style set fabled_roots:player
waypoint modify @s color hex E8DADA

execute store result storage fabled_roots:temp fabled_roots.player_size float 0.01 run random value 100..110
function fabled_roots:set_player_size with storage fabled_roots:temp fabled_roots

attribute @s minecraft:waypoint_transmit_range base set 256
attribute @s minecraft:waypoint_receive_range base set 256

attribute @s minecraft:jump_strength base set 0.5
attribute @s minecraft:safe_fall_distance base set 3.3
attribute @s minecraft:attack_damage base set 0.9
attribute @s minecraft:burning_time base set 1.5

dialog show @s fabled_roots:class_selection
