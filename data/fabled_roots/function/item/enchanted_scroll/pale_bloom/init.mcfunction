advancement revoke @s only fabled_roots:consumed_enchanted_scroll/pale_bloom

execute store result storage fabled_roots:temp enchanted_scroll.pitch int 1 run random value 0..8

function fabled_roots:item/enchanted_scroll/usage with storage fabled_roots:temp enchanted_scroll
function fabled_roots:item/enchanted_scroll/pale_bloom/exec