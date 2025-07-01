schedule function fabled_roots:trigger/class 1s

execute as @a[scores={fabled_roots.dialog_trigger.class=1}] run function fabled_roots:class/builder/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=2}] run function fabled_roots:class/survivor/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=3}] run function fabled_roots:class/miner/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=4}] run function fabled_roots:class/rancher/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=5}] run function fabled_roots:class/archer/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=6}] run function fabled_roots:class/raider/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=7}] run function fabled_roots:class/hermit/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=8}] run function fabled_roots:class/nomad/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=9}] run function fabled_roots:class/climber/selection/init
execute as @a[scores={fabled_roots.dialog_trigger.class=10}] run function fabled_roots:class/seeker/selection/init

scoreboard players set @a fabled_roots.dialog_trigger.class 0