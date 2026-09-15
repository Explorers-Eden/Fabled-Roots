rotate @s facing entity @p[distance=..16,tag=fabled_roots.descendant.leader]

execute store result score @s fabled_roots.npc.follow.motionX run data get entity @s Motion[0] 100
execute store result score @s fabled_roots.npc.follow.motionZ run data get entity @s Motion[2] 100

execute as @p[distance=..16,tag=fabled_roots.descendant.leader] run data modify storage eden:temp fabled_roots.npc.follow.leader_pos set from entity @s Pos
data modify storage eden:temp fabled_roots.npc.follow.self_pos set from entity @s Pos

execute store result score @s fabled_roots.npc.follow.dx run compute default float fabled_roots:npc/follow/dx 5
execute store result score @s fabled_roots.npc.follow.dy run compute default float fabled_roots:npc/follow/dy 50
execute store result score @s fabled_roots.npc.follow.dz run compute default float fabled_roots:npc/follow/dz 5

execute store result score @s fabled_roots.npc.follow.len2 run compute default float fabled_roots:npc/follow/len2 25

execute if score @s fabled_roots.npc.follow.len2 matches ..99 run return 0

execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dx
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dz
execute as @s[scores={fabled_roots.npc.follow.dy=43..}] run scoreboard players set @s fabled_roots.npc.follow.dy 42
execute as @s[scores={fabled_roots.npc.follow.dy=1..,fabled_roots.npc.follow.motionX=-2..2,fabled_roots.npc.follow.motionZ=-2..2}] if data entity @s {OnGround:1b} store result entity @s Motion[1] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dy
