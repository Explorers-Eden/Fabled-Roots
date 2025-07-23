advancement revoke @s only fabled_roots:consumed_enchanted_scroll/frostbite

execute store result score @s fabled_roots.exp.player.level run experience query @s levels
execute if score @s fabled_roots.exp.player.level matches ..29 run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"frostbite"}
execute unless entity @e[type=#fabled_roots:scroll_targets,distance=1..24] run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"frostbite"}

execute store result storage fabled_roots:temp enchanted_scroll.pitch int 1 run random value 0..8

execute as @s[tag=fabled_roots.frostborne] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..5
execute as @s[tag=!fabled_roots.frostborne] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..10

function fabled_roots:item/enchanted_scroll/usage with storage fabled_roots:temp enchanted_scroll
execute as @e[type=#fabled_roots:scroll_targets,distance=1..24,sort=random,limit=10] at @s run function fabled_roots:item/enchanted_scroll/frostbite/exec
