advancement revoke @s only fabled_roots:scout_used_spyglass

execute if score @s fabled_roots.scout.pos matches 64.. run return run scoreboard players set @s fabled_roots.scout.pos 0
execute store result storage eden:temp fabled_roots.spyglass_pos int 1 run scoreboard players add @s fabled_roots.scout.pos 1
function fabled_roots:class/scout/spyglass with storage eden:temp fabled_roots