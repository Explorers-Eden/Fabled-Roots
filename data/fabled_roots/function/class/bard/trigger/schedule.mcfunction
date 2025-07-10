$execute if predicate {"condition":"minecraft:random_chance","chance":0.25} if score @s fabled_roots.exp.player matches 1.. run experience add @s $(exp) points
scoreboard players set @s fabled_roots.exp.player 0

execute if score @s fabled_roots.bard.timer.active matches 1.. run scoreboard players add @s fabled_roots.bard.timer 1
execute unless score @s fabled_roots.bard.timer matches 30.. run return fail

advancement revoke @s only fabled_roots:bard_used_goat_horn
advancement revoke @s only fabled_roots:bard_used_admire_goat_horn
advancement revoke @s only fabled_roots:bard_used_call_goat_horn
advancement revoke @s only fabled_roots:bard_used_dream_goat_horn
advancement revoke @s only fabled_roots:bard_used_feel_goat_horn
advancement revoke @s only fabled_roots:bard_used_ponder_goat_horn
advancement revoke @s only fabled_roots:bard_used_seek_goat_horn
advancement revoke @s only fabled_roots:bard_used_sing_goat_horn
advancement revoke @s only fabled_roots:bard_used_yearn_goat_horn

scoreboard players set @s fabled_roots.bard.timer 0
scoreboard players set @s fabled_roots.bard.active 0