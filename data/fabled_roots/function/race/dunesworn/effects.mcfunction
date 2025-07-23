execute if entity @e[type=player,tag=fabled_roots.dunesworn,distance=1..24] run effect give @s minecraft:regeneration 2 0 true
execute if biome ~ ~ ~ #minecraft:has_structure/desert_pyramid run effect give @s minecraft:strength 2 0 true
execute if biome ~ ~ ~ #minecraft:has_structure/desert_pyramid run effect give @s minecraft:luck 2 0 true

execute if predicate fabled_roots:entity/is_crouching if items entity @s weapon.mainhand minecraft:wet_sponge run item modify entity @s weapon.mainhand {"function":"minecraft:set_item","item":"minecraft:sponge"}
execute if predicate fabled_roots:entity/is_crouching if items entity @s weapon.offhand minecraft:wet_sponge run item modify entity @s weapon.offhand {"function":"minecraft:set_item","item":"minecraft:sponge"}
execute if predicate fabled_roots:entity/is_crouching run particle dust{color:[0.761,0.655,0.427],scale:1} ~ ~ ~ .5 .5 .5 1 5 normal