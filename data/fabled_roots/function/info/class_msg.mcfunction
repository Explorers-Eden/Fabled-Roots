scoreboard players set @s fabled_roots.dialog_trigger.info 0
execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

$tellraw @s {"bold":true,"color":"gold","fallback":"$(class)","translate":"option.fabled_roots.$(class)"}
$tellraw @s {"fallback":"$(class)","translate":"option.fabled_roots.$(class).tooltip.description"}
tellraw @s " "
$tellraw @s {"fallback":"$(class)","translate":"option.fabled_roots.$(class).tooltip.stats"}