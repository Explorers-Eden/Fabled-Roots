advancement revoke @s only fabled_roots:death_message

execute store result storage eden:temp death_msg.id int 1 run random value 1..100
execute as @s[tag=fabled_roots.aetherian] run data modify storage eden:temp death_msg.race set value "aetherian"
execute as @s[tag=fabled_roots.dunesworn] run data modify storage eden:temp death_msg.race set value "dunesworn"
execute as @s[tag=fabled_roots.endling] run data modify storage eden:temp death_msg.race set value "endling"
execute as @s[tag=fabled_roots.frostborne] run data modify storage eden:temp death_msg.race set value "frostborne"
execute as @s[tag=fabled_roots.moonshroud] run data modify storage eden:temp death_msg.race set value "moonshroud"
execute as @s[tag=fabled_roots.netherian] run data modify storage eden:temp death_msg.race set value "netherian"
execute as @s[tag=fabled_roots.oakhearted] run data modify storage eden:temp death_msg.race set value "oakhearted"
execute as @s[tag=fabled_roots.orebringer] run data modify storage eden:temp death_msg.race set value "orebringer"
execute as @s[tag=fabled_roots.palehearted] run data modify storage eden:temp death_msg.race set value "palehearted"
execute as @s[tag=fabled_roots.turtlekin] run data modify storage eden:temp death_msg.race set value "turtlekin"

function fabled_roots:death_message/exec with storage eden:temp death_msg