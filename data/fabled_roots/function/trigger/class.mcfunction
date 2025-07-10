schedule function fabled_roots:trigger/class 1s

execute as @a[scores={fabled_roots.dialog_trigger.class=1}] at @s run function fabled_roots:class/builder/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=2}] at @s run function fabled_roots:class/survivor/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=3}] at @s run function fabled_roots:class/miner/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=4}] at @s run function fabled_roots:class/rancher/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=5}] at @s run function fabled_roots:class/archer/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=6}] at @s run function fabled_roots:class/fighter/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=7}] at @s run function fabled_roots:class/hermit/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=8}] at @s run function fabled_roots:class/bard/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=9}] at @s run function fabled_roots:class/cleric/selection
execute as @a[scores={fabled_roots.dialog_trigger.class=10}] at @s run function fabled_roots:class/scout/selection

scoreboard players set @a fabled_roots.dialog_trigger.class 0