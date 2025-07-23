schedule function fabled_roots:run 1s

execute as @a[tag=!fabled_roots.has_race] at @s run function fabled_roots:open_menu
execute as @e[type=#fabled_roots:is_spell_entity,tag=fabled_roots.anger_set] unless data entity @s Passengers run kill @s