effect give @s minecraft:slowness 5 255 true
$tp @s @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)]

$rotate @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] facing entity @p[distance=..16,tag=fabled_roots.descendant.leader]

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result score @s fabled_roots.npc.follow.motionX run data get entity @s Motion[0] 100
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result score @s fabled_roots.npc.follow.motionZ run data get entity @s Motion[2] 100

execute store result score @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.px run data get entity @p[distance=..16,tag=fabled_roots.descendant.leader] Pos[0] 5
execute store result score @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.py run data get entity @p[distance=..16,tag=fabled_roots.descendant.leader] Pos[1] 50
execute store result score @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.pz run data get entity @p[distance=..16,tag=fabled_roots.descendant.leader] Pos[2] 5

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result score @s fabled_roots.npc.follow.ex run data get entity @s Pos[0] 5
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result score @s fabled_roots.npc.follow.ey run data get entity @s Pos[1] 50
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result score @s fabled_roots.npc.follow.ez run data get entity @s Pos[2] 5

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dx = @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.px 
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dx -= @s fabled_roots.npc.follow.ex

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dy = @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.py 
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dy -= @s fabled_roots.npc.follow.ey 

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dz = @p[distance=..16,tag=fabled_roots.descendant.leader] fabled_roots.npc.follow.pz 
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dz -= @s fabled_roots.npc.follow.ez 

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dx2 = @s fabled_roots.npc.follow.dx
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dx2 *= @s fabled_roots.npc.follow.dx

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dy2 = @s fabled_roots.npc.follow.dy
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dy2 *= @s fabled_roots.npc.follow.dy

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dz2 = @s fabled_roots.npc.follow.dz
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.dz2 *= @s fabled_roots.npc.follow.dz

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.len2 = @s fabled_roots.npc.follow.dx2
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.len2 += @s fabled_roots.npc.follow.dy2
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] run scoreboard players operation @s fabled_roots.npc.follow.len2 += @s fabled_roots.npc.follow.dz2

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc),scores={len2=..99}] run scoreboard players set @s fabled_roots.npc.follow.dx 0
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc),scores={len2=..99}] run scoreboard players set @s fabled_roots.npc.follow.dy 0
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc),scores={len2=..99}] run scoreboard players set @s fabled_roots.npc.follow.dz 0

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result entity @s Motion[0] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dx 
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] store result entity @s Motion[2] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dz 
$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc),scores={fabled_roots.npc.follow.dy=1..,fabled_roots.npc.follow.motionX=-2..2,fabled_roots.npc.follow.motionZ=-2..2}] store result entity @s Motion[1] double 0.01 run scoreboard players get @s fabled_roots.npc.follow.dy 