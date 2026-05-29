execute as @s[tag=fabled_roots.aetherian] run data modify storage eden:temp player_info merge value {race:"aetherian",hex_color:"#a8fcff"}
execute as @s[tag=fabled_roots.dunesworn] run data modify storage eden:temp player_info merge value {race:"dunesworn",hex_color:"#C2A76D"}
execute as @s[tag=fabled_roots.endling] run data modify storage eden:temp player_info merge value {race:"endling",hex_color:"#5D3A9B"}
execute as @s[tag=fabled_roots.frostborne] run data modify storage eden:temp player_info merge value {race:"frostborne",hex_color:"#A9D6E5"}
execute as @s[tag=fabled_roots.moonshroud] run data modify storage eden:temp player_info merge value {race:"moonshroud",hex_color:"#B0B7D6"}
execute as @s[tag=fabled_roots.netherian] run data modify storage eden:temp player_info merge value {race:"netherian",hex_color:"#B23333"}
execute as @s[tag=fabled_roots.oakhearted] run data modify storage eden:temp player_info merge value {race:"oakhearted",hex_color:"#5B7B4D"}
execute as @s[tag=fabled_roots.orebringer] run data modify storage eden:temp player_info merge value {race:"orebringer",hex_color:"#857A6F"}
execute as @s[tag=fabled_roots.palehearted] run data modify storage eden:temp player_info merge value {race:"palehearted",hex_color:"#E8DADA"}
execute as @s[tag=fabled_roots.turtlekin] run data modify storage eden:temp player_info merge value {race:"turtlekin",hex_color:"#3C92A4"}

execute as @s[tag=fabled_roots.archer] run data modify storage eden:temp player_info.class set value "archer"
execute as @s[tag=fabled_roots.bard] run data modify storage eden:temp player_info.class set value "bard"
execute as @s[tag=fabled_roots.builder] run data modify storage eden:temp player_info.class set value "builder"
execute as @s[tag=fabled_roots.cleric] run data modify storage eden:temp player_info.class set value "cleric"
execute as @s[tag=fabled_roots.fighter] run data modify storage eden:temp player_info.class set value "fighter"
execute as @s[tag=fabled_roots.hermit] run data modify storage eden:temp player_info.class set value "hermit"
execute as @s[tag=fabled_roots.miner] run data modify storage eden:temp player_info.class set value "miner"
execute as @s[tag=fabled_roots.rancher] run data modify storage eden:temp player_info.class set value "rancher"
execute as @s[tag=fabled_roots.scout] run data modify storage eden:temp player_info.class set value "scout"
execute as @s[tag=fabled_roots.survivor] run data modify storage eden:temp player_info.class set value "survivor"

function fabled_roots:info/player/exec with storage eden:temp player_info