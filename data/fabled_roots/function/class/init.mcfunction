schedule function fabled_roots:class/init 1s

##exp randomizer
execute store result storage eden:temp fabled_roots.exp int 1 run random value 1..5

##effects
execute as @a[tag=fabled_roots.scout] at @s run function fabled_roots:class/scout/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.survivor] at @s run function fabled_roots:class/survivor/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.hermit] at @s run function fabled_roots:class/hermit/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.rancher] at @s run function fabled_roots:class/rancher/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.builder] at @s run function fabled_roots:class/builder/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.cleric] at @s run function fabled_roots:class/cleric/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.archer] at @s run function fabled_roots:class/archer/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.miner] at @s run function fabled_roots:class/miner/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.fighter] at @s run function fabled_roots:class/fighter/trigger/schedule with storage eden:temp fabled_roots
execute as @a[tag=fabled_roots.bard] at @s run function fabled_roots:class/bard/trigger/schedule with storage eden:temp fabled_roots