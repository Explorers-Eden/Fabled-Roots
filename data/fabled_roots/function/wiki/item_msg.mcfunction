scoreboard players set @s fabled_roots.dialog_trigger.wiki 0
execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

$tellraw @s {"bold":true,"color":"gold","translate":"item.fabled_roots.$(item)"}
$tellraw @s {"translate":"item.fabled_roots.$(item).description"}