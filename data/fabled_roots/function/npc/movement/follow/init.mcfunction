effect give @s minecraft:slowness 5 255 true
$tp @s @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)]

$execute as @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] at @s run function fabled_roots:npc/movement/follow/exec