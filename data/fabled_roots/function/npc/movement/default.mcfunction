$tp @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] @s
#$data modify entity @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] Rotation[1] set value 0F

$execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} run ride @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] mount @s
$execute unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} run ride @n[distance=..5,type=minecraft:mannequin,tag=$(attached_npc)] dismount

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} run attribute @s minecraft:scale modifier add fabled_roots:npc_riding -100 add_value
execute unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} run attribute @s minecraft:scale modifier remove fabled_roots:npc_riding