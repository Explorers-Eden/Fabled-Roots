advancement revoke @s only fabled_roots:consumed_enchanted_scroll/scouting_arrows

execute unless entity @e[type=#fabled_roots:scroll_targets,distance=1..24] run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"scouting_arrows"}

execute store result storage fabled_roots:temp enchanted_scroll.pitch int 1 run random value 0..8

function fabled_roots:item/enchanted_scroll/usage with storage fabled_roots:temp enchanted_scroll
execute as @e[type=#fabled_roots:scroll_targets,distance=1..24,limit=20,sort=random] at @s run function fabled_roots:item/enchanted_scroll/scouting_arrows/exec