schedule function fabled_roots:race/init 1s

##one-time attribute update for v3.1
execute as @a[tag=fabled_roots.has_race,tag=!fabled_roots.migrated.v3_1] run function fabled_roots:migrate/v3_1

##one-time attribute update for v3.5
execute as @a[tag=fabled_roots.has_race,tag=!fabled_roots.migrated.v3_5] run function fabled_roots:migrate/v3_5

##effects
execute as @a[tag=fabled_roots.aetherian,tag=!fabled_roots.paused] at @s run function fabled_roots:race/aetherian/effects
execute as @a[tag=fabled_roots.dunesworn,tag=!fabled_roots.paused] at @s run function fabled_roots:race/dunesworn/effects
execute as @a[tag=fabled_roots.endling,tag=!fabled_roots.paused] at @s run function fabled_roots:race/endling/effects
execute as @a[tag=fabled_roots.frostborne,tag=!fabled_roots.paused] at @s run function fabled_roots:race/frostborne/effects
execute as @a[tag=fabled_roots.moonshroud,tag=!fabled_roots.paused] at @s run function fabled_roots:race/moonshroud/effects
execute as @a[tag=fabled_roots.netherian,tag=!fabled_roots.paused] at @s run function fabled_roots:race/netherian/effects
execute as @a[tag=fabled_roots.oakhearted,tag=!fabled_roots.paused] at @s run function fabled_roots:race/oakhearted/effects
execute as @a[tag=fabled_roots.orebringer,tag=!fabled_roots.paused] at @s run function fabled_roots:race/orebringer/effects
execute as @a[tag=fabled_roots.palehearted,tag=!fabled_roots.paused] at @s run function fabled_roots:race/palehearted/effects
execute as @a[tag=fabled_roots.turtlekin,tag=!fabled_roots.paused] at @s run function fabled_roots:race/turtlekin/effects
