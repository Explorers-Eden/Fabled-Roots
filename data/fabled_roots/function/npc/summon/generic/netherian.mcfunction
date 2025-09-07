execute store result score $model fabled_roots.technical run random value 1..4

execute if score $model fabled_roots.technical matches 1..2 run data modify storage eden:temp fabled_roots.npc.model set value "slim"
execute if score $model fabled_roots.technical matches 3..4 run data modify storage eden:temp fabled_roots.npc.model set value "wide"

execute if score $model fabled_roots.technical matches 1..2 store result storage eden:temp fabled_roots.npc.id int 1 run random value 1..15
execute if score $model fabled_roots.technical matches 3..4 store result storage eden:temp fabled_roots.npc.id int 1 run random value 1..15

data modify storage eden:temp fabled_roots.npc.race set value "netherian"
data modify storage eden:temp fabled_roots.npc.race_cap set value "Netherian"

execute store result score $size fabled_roots.technical run random value 90..110
execute store result storage eden:temp fabled_roots.npc.size float 0.01 run scoreboard players get $size fabled_roots.technical
execute store result storage eden:temp fabled_roots.npc.base_size float 0.0085 run scoreboard players get $size fabled_roots.technical

execute store result storage eden:temp fabled_roots.npc.pitch float 0.01 run random value 50..200

execute positioned ~ ~.05 ~ run function fabled_roots:npc/summon/exec with storage eden:temp fabled_roots.npc