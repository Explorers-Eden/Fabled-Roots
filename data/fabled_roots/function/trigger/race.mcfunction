schedule function fabled_roots:trigger/race 1s

execute as @a[scores={fabled_roots.dialog_trigger.race=1}] run function fabled_roots:race/aetherian/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=2}] run function fabled_roots:race/dunesworn/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=3}] run function fabled_roots:race/endling/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=4}] run function fabled_roots:race/frostborne/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=5}] run function fabled_roots:race/moonshroud/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=6}] run function fabled_roots:race/netherian/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=7}] run function fabled_roots:race/oakhearted/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=8}] run function fabled_roots:race/orebringer/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=9}] run function fabled_roots:race/palehearted/selection
execute as @a[scores={fabled_roots.dialog_trigger.race=10}] run function fabled_roots:race/turtlekin/selection

scoreboard players set @a fabled_roots.dialog_trigger.race 0