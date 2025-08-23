scoreboard players set @s fabled_roots.dialog_trigger.wiki 0
execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

$tellraw @s {"bold":true,"color":"$(hex_color)","translate":"option.fabled_roots.$(race)"}
$tellraw @s {"translate":"option.fabled_roots.$(race).tooltip.description"}
tellraw @s " "
$tellraw @s {"translate":"option.fabled_roots.$(race).tooltip.stats"}