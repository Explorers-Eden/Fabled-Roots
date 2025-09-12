schedule function fabled_roots:npc/movement/init 1t

##tag players
execute as @a[gamemode=!spectator,tag=!fabled_roots.descendant.leader] at @s \
    if items entity @s weapon.* minecraft:lapis_lazuli \
    if entity @e[type=villager,tag=fabled_roots.npc.base,distance=..8] \
        run tag @s add fabled_roots.descendant.leader

execute as @a[gamemode=!spectator,tag=fabled_roots.descendant.leader] at @s \
    unless items entity @s weapon.* minecraft:lapis_lazuli \
    if entity @e[type=villager,tag=fabled_roots.npc.base,distance=..8] \
        run tag @s remove fabled_roots.descendant.leader

execute as @a[gamemode=!spectator,tag=fabled_roots.descendant.leader] at @s \
    if items entity @s weapon.* minecraft:lapis_lazuli \
    unless entity @e[type=villager,tag=fabled_roots.npc.base,distance=..8] \
        run tag @s remove fabled_roots.descendant.leader


##tag npcs
execute as @e[type=villager,tag=fabled_roots.npc.base] at @s \
    unless entity @e[type=player,gamemode=!spectator,distance=..8,tag=fabled_roots.descendant.leader] \
        run tag @s remove fabled_roots.descendant.following

execute as @a[gamemode=!spectator,tag=fabled_roots.descendant.leader] at @s \
    run execute as @e[type=villager,tag=fabled_roots.npc.base,distance=..8] at @s \
        if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} \
            run tag @s remove fabled_roots.descendant.following

execute as @a[gamemode=!spectator,tag=fabled_roots.descendant.leader] at @s \
    unless entity @e[type=villager,tag=fabled_roots.npc.base,distance=..8,tag=fabled_roots.descendant.following] \
        run execute as @n[type=villager,tag=fabled_roots.npc.base,distance=..8] at @s \
            unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} \
                run tag @s add fabled_roots.descendant.following


##do movement
execute as @e[type=villager,tag=fabled_roots.npc.base,tag=!fabled_roots.descendant.following] at @s \
    run function fabled_roots:npc/movement/default with entity @s data

execute as @e[type=villager,tag=fabled_roots.npc.base,tag=fabled_roots.descendant.following] at @s \
    run function fabled_roots:npc/movement/follow/init with entity @s data