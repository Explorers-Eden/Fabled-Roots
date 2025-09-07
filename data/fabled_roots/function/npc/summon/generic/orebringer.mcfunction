execute store result score $model fabled_roots.technical run random value 1..4

execute if score $model fabled_roots.technical matches 1 run data modify storage eden:temp fabled_roots.npc.model set value "slim"
execute if score $model fabled_roots.technical matches 2..4 run data modify storage eden:temp fabled_roots.npc.model set value "wide"

execute if score $model fabled_roots.technical matches 1 store result storage eden:temp fabled_roots.npc.id int 1 run random value 1..4
execute if score $model fabled_roots.technical matches 2..4 store result storage eden:temp fabled_roots.npc.id int 1 run random value 1..20

data modify storage eden:temp fabled_roots.npc.race set value "orebringer"
data modify storage eden:temp fabled_roots.npc.race_cap set value "Orebringer"

execute store result storage eden:temp fabled_roots.npc.size float 0.01 run random value 75..90
execute store result storage eden:temp fabled_roots.npc.pitch float 0.01 run random value 50..200

execute positioned ~ ~.05 ~ run function fabled_roots:npc/summon/exec with storage eden:temp fabled_roots.npc