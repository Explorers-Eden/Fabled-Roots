execute as @s[advancements={fabled_roots:fighter_killed_entity=true}] run effect give @s minecraft:strength 5 2 true
execute as @s[advancements={fabled_roots:fighter_blocked_dmg=true}] if predicate {"condition":"minecraft:random_chance","chance":0.25} run scoreboard players set @s fabled_roots.exp.player 1
execute as @s[advancements={fabled_roots:fighter_killed_entity=true}] run scoreboard players set @s fabled_roots.exp.player 1


advancement revoke @s only fabled_roots:fighter_killed_entity
advancement revoke @s only fabled_roots:fighter_blocked_dmg