advancement revoke @s only fabled_roots:consumed_enchanted_scroll/ender_lure

execute unless entity @e[type=#fabled_roots:scroll_targets,distance=1..24] run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"ender_lure"}

execute store result storage eden:temp enchanted_scroll.pitch int 1 run random value 0..8

execute as @n[type=#fabled_roots:scroll_targets,distance=1..24] run function fabled_roots:item/enchanted_scroll/get_uuid

function fabled_roots:item/enchanted_scroll/usage with storage eden:temp enchanted_scroll
function fabled_roots:item/enchanted_scroll/ender_lure/exec with storage eden:temp enchanted_scroll