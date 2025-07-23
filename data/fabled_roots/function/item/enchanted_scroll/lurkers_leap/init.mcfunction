advancement revoke @s only fabled_roots:consumed_enchanted_scroll/lurkers_leap

execute store result score @s fabled_roots.exp.player.level run experience query @s levels
execute if score @s fabled_roots.exp.player.level matches ..29 run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"lurkers_leap"}
execute unless entity @e[type=#fabled_roots:scroll_targets,distance=1..24] run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"lurkers_leap"}

execute at @n[type=#fabled_roots:scroll_targets,distance=1..24] \
    unless block ~1 ~ ~ #fabled_roots:safe_to_tp \
    unless block ~-1 ~ ~ #fabled_roots:safe_to_tp \
    unless block ~ ~ ~1 #fabled_roots:safe_to_tp \
    unless block ~ ~ ~-1 #fabled_roots:safe_to_tp \
    unless block ~1 ~ ~1 #fabled_roots:safe_to_tp \
    unless block ~-1 ~ ~1 #fabled_roots:safe_to_tp \
    unless block ~-1 ~ ~1 #fabled_roots:safe_to_tp \
    unless block ~1 ~ ~-1 #fabled_roots:safe_to_tp \
        run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"lurkers_leap"}

execute store result storage fabled_roots:temp enchanted_scroll.pitch int 1 run random value 0..8

execute as @s[tag=fabled_roots.palehearted] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..5
execute as @s[tag=!fabled_roots.palehearted] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..10

function fabled_roots:item/enchanted_scroll/usage with storage fabled_roots:temp enchanted_scroll
function fabled_roots:item/enchanted_scroll/lurkers_leap/exec