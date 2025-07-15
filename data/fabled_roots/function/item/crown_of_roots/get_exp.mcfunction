execute store result score @s fabled_roots.exp.player.level run experience query @s levels
execute if score @s fabled_roots.exp.player.level matches ..0 run return fail

execute as @s[tag=fabled_roots.aetherian] if entity @e[type=player,tag=fabled_roots.aetherian,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"aetherian"}
execute as @s[tag=fabled_roots.dunesworn] if entity @e[type=player,tag=fabled_roots.dunesworn,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"dunesworn"}
execute as @s[tag=fabled_roots.endling] if entity @e[type=happy_ghast,tag=fabled_roots.endling,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"endling"}
execute as @s[tag=fabled_roots.frostborne] if entity @e[type=player,tag=fabled_roots.frostborne,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"frostborne"}
execute as @s[tag=fabled_roots.moonshroud] if entity @e[type=player,tag=fabled_roots.moonshroud,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"moonshroud"}
execute as @s[tag=fabled_roots.netherian] if entity @e[type=player,tag=fabled_roots.netherian,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"netherian"}
execute as @s[tag=fabled_roots.oakhearted] if entity @e[type=player,tag=fabled_roots.oakhearted,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"oakhearted"}
execute as @s[tag=fabled_roots.orebringer] if entity @e[type=player,tag=fabled_roots.orebringer,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"orebringer"}
execute as @s[tag=fabled_roots.palehearted] if entity @e[type=player,tag=fabled_roots.palehearted,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"palehearted"}
execute as @s[tag=fabled_roots.turtlekin] if entity @e[type=player,tag=fabled_roots.turtlekin,distance=1..24] run return run function fabled_roots:item/crown_of_roots/exec {race:"turtlekin"}