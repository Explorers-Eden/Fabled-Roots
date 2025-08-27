advancement revoke @s only fabled_roots:consumed_enchanted_scroll/webbing

execute unless entity @e[type=#fabled_roots:scroll_targets,distance=1..24] run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"webbing"}

execute store result storage eden:temp enchanted_scroll.pitch int 1 run random value 0..8

function fabled_roots:item/enchanted_scroll/usage with storage eden:temp enchanted_scroll
execute as @e[type=#fabled_roots:scroll_targets,distance=1..24,sort=random,limit=10] at @s if block ~ ~1 ~ air run function fabled_roots:item/enchanted_scroll/webbing/exec