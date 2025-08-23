schedule function fabled_roots:trigger/init 1s

scoreboard players enable @a fabled_roots.dialog_trigger.reset
scoreboard players enable @a fabled_roots.dialog_trigger.wiki

execute as @a[scores={fabled_roots.dialog_trigger.class=1..}] run function fabled_roots:trigger/class
execute as @a[scores={fabled_roots.dialog_trigger.race=1..}] run function fabled_roots:trigger/race
execute as @a[scores={fabled_roots.dialog_trigger.reset=1..}] run function fabled_roots:trigger/reset
execute as @a[scores={fabled_roots.dialog_trigger.wiki=1..}] run function fabled_roots:trigger/wiki