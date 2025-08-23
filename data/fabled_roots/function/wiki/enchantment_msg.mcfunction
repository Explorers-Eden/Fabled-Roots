scoreboard players set @s fabled_roots.dialog_trigger.wiki 0
execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

$tellraw @s {"bold":true,"color":"dark_purple","translate":"enchantment.fabled_roots.$(enchantment)"}
$tellraw @s {"translate":"enchantment.fabled_roots.$(enchantment).description"}