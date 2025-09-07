##forceload spawn chunk in case it isn't loaded
forceload add 0 0

##gamerules
gamerule locatorBar true
gamerule showDeathMessages false

##add default scoreboard
scoreboard objectives add fabled_roots.technical dummy

##dialog trigger scoreboards
scoreboard objectives add fabled_roots.dialog_trigger.race trigger {"bold":false,"color":"green","italic":false,"text":"Fabled Roots: Race Selection"}
scoreboard objectives add fabled_roots.dialog_trigger.class trigger {"bold":false,"color":"green","italic":false,"text":"Fabled Roots: Class Selection"}
scoreboard objectives add fabled_roots.dialog_trigger.reset trigger {"bold":false,"color":"green","italic":false,"text":"Fabled Roots: Reset Roots"}
scoreboard objectives add fabled_roots.dialog_trigger.wiki trigger {"bold":false,"color":"green","italic":false,"text":"Fabled Roots: Wiki"}

##additional scoreboards
scoreboard objectives add fabled_roots.exp.player.level dummy
scoreboard objectives add fabled_roots.exp.class_ability dummy
scoreboard objectives add fabled_roots.received_equip dummy
scoreboard objectives add fabled_roots.bard.timer.active dummy
scoreboard objectives add fabled_roots.bard.timer dummy
scoreboard objectives add fabled_roots.scout.pos dummy
scoreboard objectives add fabled_roots.exp.miner.coal_ore minecraft.mined:minecraft.coal_ore
scoreboard objectives add fabled_roots.exp.miner.iron_ore minecraft.mined:minecraft.iron_ore
scoreboard objectives add fabled_roots.exp.miner.copper_ore minecraft.mined:minecraft.copper_ore
scoreboard objectives add fabled_roots.exp.miner.lapis_ore minecraft.mined:minecraft.lapis_ore
scoreboard objectives add fabled_roots.exp.miner.emerald_ore minecraft.mined:minecraft.emerald_ore
scoreboard objectives add fabled_roots.exp.miner.diamond_ore minecraft.mined:minecraft.diamond_ore
scoreboard objectives add fabled_roots.exp.miner.gold_ore minecraft.mined:minecraft.gold_ore
scoreboard objectives add fabled_roots.exp.miner.redstone_ore minecraft.mined:minecraft.redstone_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_coal_ore minecraft.mined:minecraft.deepslate_coal_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_iron_ore minecraft.mined:minecraft.deepslate_iron_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_copper_ore minecraft.mined:minecraft.deepslate_copper_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_lapis_ore minecraft.mined:minecraft.deepslate_lapis_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_emerald_ore minecraft.mined:minecraft.deepslate_emerald_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_diamond_ore minecraft.mined:minecraft.deepslate_diamond_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_gold_ore minecraft.mined:minecraft.deepslate_gold_ore
scoreboard objectives add fabled_roots.exp.miner.deepslate_redstone_ore minecraft.mined:minecraft.deepslate_redstone_ore
scoreboard objectives add fabled_roots.exp.miner.ancient_debris minecraft.mined:minecraft.ancient_debris
scoreboard objectives add fabled_roots.exp.miner.nether_gold_ore minecraft.mined:minecraft.nether_gold_ore
scoreboard objectives add fabled_roots.exp.miner.nether_quartz_ore minecraft.mined:minecraft.nether_quartz_ore

 ##add teams
team add fabled_roots.frostborne {"bold":false,"color":"#A9D6E5","italic":false,"text":"Frostborne"}
team add fabled_roots.moonshroud {"bold":false,"color":"#B0B7D6","italic":false,"text":"Moonshroud"}
team add fabled_roots.netherian {"bold":false,"color":"#B23333","italic":false,"text":"Netherian"}
team add fabled_roots.oakhearted {"bold":false,"color":"#5B7B4D","italic":false,"text":"Oakhearted"}
team add fabled_roots.orebringer {"bold":false,"color":"#857A6F","italic":false,"text":"Orebringer"}
team add fabled_roots.turtlekin {"bold":false,"color":"#3C92A4","italic":false,"text":"Turtlekin"}
team add fabled_roots.dunesworn {"bold":false,"color":"#C2A76D","italic":false,"text":"Dunesworn"}
team add fabled_roots.endling {"bold":false,"color":"#5D3A9B","italic":false,"text":"Endling"}
team add fabled_roots.palehearted {"bold":false,"color":"#E8DADA","italic":false,"text":"Palehearted"}
team add fabled_roots.aetherian {"bold":false,"color":"#a8fcff","italic":false,"text":"Aetherian"}
team add fabled_roots.npc

##modify teams
team modify fabled_roots.npc collisionRule pushOwnTeam
team modify fabled_roots.npc nametagVisibility never

team modify fabled_roots.frostborne friendlyFire false
team modify fabled_roots.frostborne seeFriendlyInvisibles true
team modify fabled_roots.frostborne color white
team modify fabled_roots.frostborne prefix [{"text":"Frostborne","color":"#A9D6E5"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.moonshroud friendlyFire false
team modify fabled_roots.moonshroud seeFriendlyInvisibles true
team modify fabled_roots.moonshroud color white
team modify fabled_roots.moonshroud prefix [{"text":"Moonshroud","color":"#B0B7D6"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.netherian friendlyFire false
team modify fabled_roots.netherian seeFriendlyInvisibles true
team modify fabled_roots.netherian color white
team modify fabled_roots.netherian prefix [{"text":"Netherian","color":"#B23333"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.oakhearted friendlyFire false
team modify fabled_roots.oakhearted seeFriendlyInvisibles true
team modify fabled_roots.oakhearted color white
team modify fabled_roots.oakhearted prefix [{"text":"Oakhearted","color":"#5B7B4D"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.orebringer friendlyFire false
team modify fabled_roots.orebringer seeFriendlyInvisibles true
team modify fabled_roots.orebringer color white
team modify fabled_roots.orebringer prefix [{"text":"Orebringer","color":"#857A6F"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.turtlekin friendlyFire false
team modify fabled_roots.turtlekin seeFriendlyInvisibles true
team modify fabled_roots.turtlekin color white
team modify fabled_roots.turtlekin prefix [{"text":"Turtlekin","color":"#3C92A4"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.dunesworn friendlyFire false
team modify fabled_roots.dunesworn seeFriendlyInvisibles true
team modify fabled_roots.dunesworn color white
team modify fabled_roots.dunesworn prefix [{"text":"Dunesworn","color":"#C2A76D"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.endling friendlyFire false
team modify fabled_roots.endling seeFriendlyInvisibles true
team modify fabled_roots.endling color white
team modify fabled_roots.endling prefix [{"text":"Endling","color":"#5D3A9B"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.palehearted friendlyFire false
team modify fabled_roots.palehearted seeFriendlyInvisibles true
team modify fabled_roots.palehearted color white
team modify fabled_roots.palehearted prefix [{"text":"Palehearted","color":"#E8DADA"},{"text":" | ","color":"dark_gray"}]

team modify fabled_roots.aetherian friendlyFire false
team modify fabled_roots.aetherian seeFriendlyInvisibles true
team modify fabled_roots.aetherian color white
team modify fabled_roots.aetherian prefix [{"text":"Aetherian","color":"#D4F1FF"},{"text":" | ","color":"dark_gray"}]

##set data pack version
data modify storage eden:datapack fabled_roots.version set value "1.5"