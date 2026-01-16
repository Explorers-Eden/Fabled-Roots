data remove storage eden:datapack fabled_roots
data remove storage eden:settings fabled_roots

forceload remove 0 0

gamerule locator_bar false
gamerule show_death_messages true

scoreboard objectives remove fabled_roots.technical
scoreboard objectives remove fabled_roots.dialog_trigger.race
scoreboard objectives remove fabled_roots.dialog_trigger.class
scoreboard objectives remove fabled_roots.dialog_trigger.reset
scoreboard objectives remove fabled_roots.dialog_trigger.wiki
scoreboard objectives remove fabled_roots.exp.player.level
scoreboard objectives remove fabled_roots.exp.class_ability
scoreboard objectives remove fabled_roots.received_equip
scoreboard objectives remove fabled_roots.bard.timer.active
scoreboard objectives remove fabled_roots.bard.timer
scoreboard objectives remove fabled_roots.scout.timer.active
scoreboard objectives remove fabled_roots.scout.timer
scoreboard objectives remove fabled_roots.scout.pos
scoreboard objectives remove fabled_roots.decoy.timer
scoreboard objectives remove fabled_roots.exp.miner.coal_ore
scoreboard objectives remove fabled_roots.exp.miner.iron_ore
scoreboard objectives remove fabled_roots.exp.miner.copper_ore
scoreboard objectives remove fabled_roots.exp.miner.lapis_ore
scoreboard objectives remove fabled_roots.exp.miner.emerald_ore
scoreboard objectives remove fabled_roots.exp.miner.diamond_ore
scoreboard objectives remove fabled_roots.exp.miner.gold_ore
scoreboard objectives remove fabled_roots.exp.miner.redstone_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_coal_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_iron_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_copper_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_lapis_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_emerald_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_diamond_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_gold_ore
scoreboard objectives remove fabled_roots.exp.miner.deepslate_redstone_ore
scoreboard objectives remove fabled_roots.exp.miner.ancient_debris
scoreboard objectives remove fabled_roots.exp.miner.nether_gold_ore
scoreboard objectives remove fabled_roots.exp.miner.nether_quartz_ore
scoreboard objectives remove fabled_roots.npc.bartering.timer
scoreboard objectives remove fabled_roots.npc.follow.px
scoreboard objectives remove fabled_roots.npc.follow.py
scoreboard objectives remove fabled_roots.npc.follow.pz
scoreboard objectives remove fabled_roots.npc.follow.dx
scoreboard objectives remove fabled_roots.npc.follow.dy
scoreboard objectives remove fabled_roots.npc.follow.dz
scoreboard objectives remove fabled_roots.npc.follow.ex
scoreboard objectives remove fabled_roots.npc.follow.ey
scoreboard objectives remove fabled_roots.npc.follow.ez
scoreboard objectives remove fabled_roots.npc.follow.dx2
scoreboard objectives remove fabled_roots.npc.follow.dy2
scoreboard objectives remove fabled_roots.npc.follow.dz2
scoreboard objectives remove fabled_roots.npc.follow.len2
scoreboard objectives remove fabled_roots.npc.follow.motionX
scoreboard objectives remove fabled_roots.npc.follow.motionZ

team remove fabled_roots.npc
team remove fabled_roots.decoy
team remove fabled_roots.frostborne
team remove fabled_roots.moonshroud
team remove fabled_roots.netherian
team remove fabled_roots.oakhearted
team remove fabled_roots.orebringer
team remove fabled_roots.turtlekin
team remove fabled_roots.dunesworn
team remove fabled_roots.endling
team remove fabled_roots.palehearted
team remove fabled_roots.aetherian

playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .5 2
tellraw @s [\
    {"color":"red","text":"▊ "},\
    {"color":"white","text":"Files for Fabled Roots have been removed."}\
]