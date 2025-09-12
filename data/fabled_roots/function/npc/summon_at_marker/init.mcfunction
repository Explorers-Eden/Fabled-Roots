schedule function fabled_roots:npc/summon_at_marker/init 1s

##Example: summon marker ~ ~ ~ {Tags:["fabled_roots.npc.spawner"],data:{type:"generic",race:"aetherian"}}
execute as @e[type=marker,tag=fabled_roots.npc.spawner] at @s run function fabled_roots:npc/summon_at_marker/exec with entity @s data