data remove entity @s Brain.memories.minecraft:home
data modify entity @s Age set value 2400
team join fabled_roots.npc @s
$execute unless entity @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run function fabled_roots:npc/update/kill

$execute if data entity @s VillagerData{profession:"minecraft:none"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with air
$execute if data entity @s VillagerData{profession:"minecraft:nitwit"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with air
$execute if data entity @s VillagerData{profession:"minecraft:cleric"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with air
$execute if data entity @s VillagerData{profession:"minecraft:leatherworker"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with air
$execute if data entity @s VillagerData{profession:"minecraft:mason"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with air
$execute if data entity @s VillagerData{profession:"minecraft:toolsmith"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with air

$execute if data entity @s VillagerData{profession:"minecraft:librarian"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_librarian"]
$execute if data entity @s VillagerData{profession:"minecraft:armorer"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_armorer"]
$execute if data entity @s VillagerData{profession:"minecraft:butcher"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_butcher"]
$execute if data entity @s VillagerData{profession:"minecraft:cartographer"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_cartographer"]
$execute if data entity @s VillagerData{profession:"minecraft:farmer"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_farmer"]
$execute if data entity @s VillagerData{profession:"minecraft:fisherman"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_fisherman"]
$execute if data entity @s VillagerData{profession:"minecraft:fletcher"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_fletcher"]
$execute if data entity @s VillagerData{profession:"minecraft:shepherd"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_shepherd"]
$execute if data entity @s VillagerData{profession:"minecraft:weaponsmith"} as @e[distance=..1,type=minecraft:mannequin,tag=$(attached_npc)] run return run item replace entity @s armor.head with minecraft:music_disc_5[minecraft:item_model="fabled_roots:villager_hat_weaponsmith"]