$tp @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] @s
$data modify entity @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] Rotation[1] set value 0F

$execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} run ride @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] mount @s
$execute unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} run ride @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] dismount