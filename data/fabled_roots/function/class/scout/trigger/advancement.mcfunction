advancement revoke @s only fabled_roots:scout_used_spyglass

execute store result storage eden:temp fabled_roots.spyglass_pos int 1 run scoreboard players add @s fabled_roots.scout.pos 1
function fabled_roots:class/scout/spyglass with storage eden:temp fabled_roots