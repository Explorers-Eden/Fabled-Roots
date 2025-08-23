schedule function fabled_roots:trigger/reset 1s

execute as @s[scores={fabled_roots.dialog_trigger.reset=1}] run function fabled_roots:reset_player/init

scoreboard players set @s fabled_roots.dialog_trigger.reset 0