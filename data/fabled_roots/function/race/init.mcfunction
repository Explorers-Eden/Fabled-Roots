schedule function fabled_roots:race/init 1s

##one-time attribute update for v3.1
execute as @a[tag=fabled_roots.has_race,tag=!fabled_roots.migrated.v3_1] run function fabled_roots:migrate/v3_1

##effects
execute as @a[tag=fabled_roots.aetherian] at @s run function fabled_roots:race/aetherian/effects
execute as @a[tag=fabled_roots.dunesworn] at @s run function fabled_roots:race/dunesworn/effects
execute as @a[tag=fabled_roots.endling] at @s run function fabled_roots:race/endling/effects
execute as @a[tag=fabled_roots.frostborne] at @s run function fabled_roots:race/frostborne/effects
execute as @a[tag=fabled_roots.moonshroud] at @s run function fabled_roots:race/moonshroud/effects
execute as @a[tag=fabled_roots.netherian] at @s run function fabled_roots:race/netherian/effects
execute as @a[tag=fabled_roots.oakhearted] at @s run function fabled_roots:race/oakhearted/effects
execute as @a[tag=fabled_roots.orebringer] at @s run function fabled_roots:race/orebringer/effects
execute as @a[tag=fabled_roots.palehearted] at @s run function fabled_roots:race/palehearted/effects
execute as @a[tag=fabled_roots.turtlekin] at @s run function fabled_roots:race/turtlekin/effects
