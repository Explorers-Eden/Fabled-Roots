##add default values
execute unless data storage eden:settings fabled_roots run function fabled_roots:default_values
execute unless data storage eden:datapack fabled_roots{version:"1.8"} run function fabled_roots:default_values

##forceload spawn chunk in case it isn't loaded
forceload add 0 0

##gamerules
gamerule locator_bar true
gamerule show_death_messages false

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
scoreboard objectives add fabled_roots.scout.timer.active dummy
scoreboard objectives add fabled_roots.scout.timer dummy
scoreboard objectives add fabled_roots.scout.pos dummy
scoreboard objectives add fabled_roots.decoy.timer dummy
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

##npc scoreboards
scoreboard objectives add fabled_roots.npc.bartering.timer dummy
scoreboard objectives add fabled_roots.npc.follow.px dummy
scoreboard objectives add fabled_roots.npc.follow.py dummy
scoreboard objectives add fabled_roots.npc.follow.pz dummy
scoreboard objectives add fabled_roots.npc.follow.dx dummy
scoreboard objectives add fabled_roots.npc.follow.dy dummy
scoreboard objectives add fabled_roots.npc.follow.dz dummy
scoreboard objectives add fabled_roots.npc.follow.ex dummy
scoreboard objectives add fabled_roots.npc.follow.ey dummy
scoreboard objectives add fabled_roots.npc.follow.ez dummy
scoreboard objectives add fabled_roots.npc.follow.dx2 dummy
scoreboard objectives add fabled_roots.npc.follow.dy2 dummy
scoreboard objectives add fabled_roots.npc.follow.dz2 dummy
scoreboard objectives add fabled_roots.npc.follow.len2 dummy
scoreboard objectives add fabled_roots.npc.follow.motionX dummy
scoreboard objectives add fabled_roots.npc.follow.motionZ dummy

##add teams
function fabled_roots:teams/add
team add fabled_roots.npc
team add fabled_roots.decoy

##modify teams
function fabled_roots:teams/friendlyfire
function fabled_roots:teams/prefix
function fabled_roots:teams/seefriendlyinvisibles
team modify fabled_roots.npc collisionRule pushOwnTeam
team modify fabled_roots.npc nametagVisibility never
team modify fabled_roots.decoy collisionRule never
team modify fabled_roots.decoy nametagVisibility never

##set data pack version
data modify storage eden:datapack fabled_roots.version set value "1.8"