advancement revoke @s only fabled_roots:consumed_enchanted_scroll/sculky_bloom

execute store result score @s fabled_roots.exp.player.level run experience query @s levels
execute if score @s fabled_roots.exp.player.level matches ..29 run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"sculky_bloom"}

execute store result storage fabled_roots:temp enchanted_scroll.pitch int 1 run random value 0..8

execute as @s[tag=fabled_roots.moonshroud] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..5
execute as @s[tag=!fabled_roots.moonshroud] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..10

function fabled_roots:item/enchanted_scroll/usage with storage fabled_roots:temp enchanted_scroll
function fabled_roots:item/enchanted_scroll/sculky_bloom/exec