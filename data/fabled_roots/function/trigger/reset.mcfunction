schedule function fabled_roots:trigger/reset 1s

scoreboard players enable @a fabled_roots.dialog_trigger.reset
execute as @a[scores={fabled_roots.dialog_trigger.reset=1}] run function fabled_roots:reset_player/init

scoreboard players set @a fabled_roots.dialog_trigger.reset 0