scoreboard players set @s fabled_roots.dialog_trigger.info 0
execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

$tellraw @s {"bold":true,"color":"dark_purple","fallback":"$(enchantment)","translate":"enchantment.fabled_roots.$(enchantment)"}
$tellraw @s {"fallback":"$(enchantment)","translate":"enchantment.fabled_roots.$(enchantment).description"}