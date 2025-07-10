effect give @e[type=#eden:hostile_mobs,distance=..16] glowing 2 0 true
$execute if predicate {"condition":"minecraft:random_chance","chance":0.025} if entity @e[type=#eden:scout_effect,distance=..16] run experience add @s $(exp) points
execute if score @s fabled_roots.scout.pos matches 128.. run scoreboard players set @s fabled_roots.scout.pos 0