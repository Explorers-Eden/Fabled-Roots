scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.coal_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.iron_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.copper_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.lapis_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.emerald_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.diamond_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.gold_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.redstone_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_coal_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_iron_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_copper_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_lapis_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_emerald_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_diamond_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_gold_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.deepslate_redstone_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.ancient_debris
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.nether_gold_ore
scoreboard players operation @s fabled_roots.exp.player += @s fabled_roots.exp.miner.nether_quartz_ore

$execute if score @s fabled_roots.exp.player matches 1.. if predicate {"condition":"minecraft:random_chance","chance":0.5} run experience add @s $(exp) points

scoreboard players set @s fabled_roots.exp.player 0
scoreboard players set @s fabled_roots.exp.miner.coal_ore 0
scoreboard players set @s fabled_roots.exp.miner.iron_ore 0
scoreboard players set @s fabled_roots.exp.miner.copper_ore 0
scoreboard players set @s fabled_roots.exp.miner.lapis_ore 0
scoreboard players set @s fabled_roots.exp.miner.emerald_ore 0
scoreboard players set @s fabled_roots.exp.miner.diamond_ore 0
scoreboard players set @s fabled_roots.exp.miner.gold_ore 0
scoreboard players set @s fabled_roots.exp.miner.redstone_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_coal_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_iron_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_copper_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_lapis_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_emerald_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_diamond_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_gold_ore 0
scoreboard players set @s fabled_roots.exp.miner.deepslate_redstone_ore 0
scoreboard players set @s fabled_roots.exp.miner.ancient_debris 0
scoreboard players set @s fabled_roots.exp.miner.nether_gold_ore 0
scoreboard players set @s fabled_roots.exp.miner.nether_quartz_ore 0