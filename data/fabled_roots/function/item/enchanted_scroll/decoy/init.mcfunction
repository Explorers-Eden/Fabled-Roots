advancement revoke @s only fabled_roots:consumed_enchanted_scroll/decoy

execute store result storage eden:temp enchanted_scroll.pitch int 1 run random value 0..8
execute store result storage eden:temp enchanted_scroll.rotation int 1 run random value -180..90
function fabled_roots:item/enchanted_scroll/usage with storage eden:temp enchanted_scroll

function fabled_roots:item/enchanted_scroll/decoy/exec with storage eden:temp enchanted_scroll