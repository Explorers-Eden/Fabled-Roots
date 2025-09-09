execute unless entity @e[distance=..2,type=minecraft:villager,tag=fabled_roots.npc.base] run function fabled_roots:npc/behavior/kill

execute \
    as @s[tag=fabled_roots.npc.generic] \
    if entity @e[type=minecraft:item,distance=..1.25] \
    unless items entity @s weapon.mainhand minecraft:lapis_lazuli \
    as @e[type=minecraft:item,distance=..1,sort=random,limit=1] \
    if items entity @s container.0 minecraft:lapis_lazuli \
        run function fabled_roots:npc/behavior/barter/init

execute if items entity @s weapon.mainhand minecraft:lapis_lazuli run scoreboard players add @s fabled_roots.npc.bartering.timer 1

execute \
    if score @s fabled_roots.npc.bartering.timer matches 5.. \
    if items entity @s weapon.mainhand minecraft:lapis_lazuli \
        run return run function fabled_roots:npc/behavior/barter/payout with entity @s data

$execute if score @s fabled_roots.npc.bartering.timer matches 1 run return run playsound fabled_roots:entity.descendant.encourage ambient @a ~ ~ ~ 0.5 $(pitch)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.025} run playsound fabled_roots:entity.descendant.ambient ambient @a ~ ~ ~ 0.5 $(pitch)