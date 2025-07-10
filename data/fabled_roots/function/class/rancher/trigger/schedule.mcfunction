$execute if score @s fabled_roots.exp.player matches 1.. run experience add @s $(exp) points
$execute as @e[type=#eden:rancher_effect,distance=..16] on leasher if predicate {"condition":"minecraft:random_chance","chance":0.025} run experience add @s $(exp) points

execute on vehicle run effect give @s minecraft:speed 2 2 true

scoreboard players set @s fabled_roots.exp.player 0
