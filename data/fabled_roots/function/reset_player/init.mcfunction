execute store result score @s fabled_roots.exp.player.level run experience query @s levels
execute if score @s fabled_roots.exp.player.level matches ..99 at @s run return run function fabled_roots:reset_player/insufficient_level

experience set @s 0 levels
experience set @s 0 points

function fabled_roots:remove/class
function fabled_roots:remove/race