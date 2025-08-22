schedule function fabled_roots:trigger/wiki 1s
scoreboard players enable @a fabled_roots.dialog_trigger.wiki

#execute as @a[scores={fabled_roots.dialog_trigger.wiki=1}] at @s run function fabled_roots:wiki/classes/archer

scoreboard players set @a fabled_roots.dialog_trigger.wiki 0