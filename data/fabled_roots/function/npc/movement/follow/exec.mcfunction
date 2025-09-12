rotate @s facing entity @p[distance=..16,tag=fabled_roots.descendant.leader]

execute store result score @s fabled_roots.npc.follow.motionX run data get entity @s Motion[0] 100
execute store result score @s fabled_roots.npc.follow.motionZ run data get entity @s Motion[2] 100

execute store result score @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.px run data get entity @p[distance=..16,tag=fabled_roots.descendant.leader] Pos[0] 5
execute store result score @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.py run data get entity @p[distance=..16,tag=fabled_roots.descendant.leader] Pos[1] 50
execute store result score @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.pz run data get entity @p[distance=..16,tag=fabled_roots.descendant.leader] Pos[2] 5

execute store result score @s fabled_roots.npc.follow.ex run data get entity @s Pos[0] 5
execute store result score @s fabled_roots.npc.follow.ey run data get entity @s Pos[1] 50
execute store result score @s fabled_roots.npc.follow.ez run data get entity @s Pos[2] 5

scoreboard players operation @s fabled_roots.npc.follow.dx = @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.px 
scoreboard players operation @s fabled_roots.npc.follow.dx -= @s fabled_roots.npc.follow.ex

scoreboard players operation @s fabled_roots.npc.follow.dy = @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.py 
scoreboard players operation @s fabled_roots.npc.follow.dy -= @s fabled_roots.npc.follow.ey 

scoreboard players operation @s fabled_roots.npc.follow.dz = @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.pz 
scoreboard players operation @s fabled_roots.npc.follow.dz -= @s fabled_roots.npc.follow.ez 

scoreboard players operation @s fabled_roots.npc.follow.dx2 = @s fabled_roots.npc.follow.dx
scoreboard players operation @s fabled_roots.npc.follow.dx2 *= @s fabled_roots.npc.follow.dx

scoreboard players operation @s fabled_roots.npc.follow.dy2 = @s fabled_roots.npc.follow.dy
scoreboard players operation @s fabled_roots.npc.follow.dy2 *= @s fabled_roots.npc.follow.dy

scoreboard players operation @s fabled_roots.npc.follow.dz2 = @s fabled_roots.npc.follow.dz
scoreboard players operation @s fabled_roots.npc.follow.dz2 *= @s fabled_roots.npc.follow.dz

scoreboard players operation @s fabled_roots.npc.follow.len2 = @s fabled_roots.npc.follow.dx2
scoreboard players operation @s fabled_roots.npc.follow.len2 += @s fabled_roots.npc.follow.dy2
scoreboard players operation @s fabled_roots.npc.follow.len2 += @s fabled_roots.npc.follow.dz2

execute as @s[scores={fabled_roots.npc.follow.len2=..99}] run scoreboard players set @s fabled_roots.npc.follow.dx 0
execute as @s[scores={fabled_roots.npc.follow.len2=..99}] run scoreboard players set @s fabled_roots.npc.follow.dy 0
execute as @s[scores={fabled_roots.npc.follow.len2=..99}] run scoreboard players set @s fabled_roots.npc.follow.dz 0

execute store result entity @s Motion[0] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dx 
execute store result entity @s Motion[2] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dz 
execute as @s[scores={fabled_roots.npc.follow.dy=1..,fabled_roots.npc.follow.motionX=-2..2,fabled_roots.npc.follow.motionZ=-2..2}] store result entity @s Motion[1] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dy 