execute store result storage eden:temp fabled_roots.npc.orebringer.id int 1 run random value 1..5

execute store result score $npc_size fabled_roots.technical run random value 75..90
execute store result storage eden:temp fabled_roots.npc.orebringer.size float 0.01 run scoreboard players get $npc_size fabled_roots.technical
execute store result storage eden:temp fabled_roots.npc.orebringer.base_size float 0.009 run scoreboard players get $npc_size fabled_roots.technical

function fabled_roots:npc/type/orebringer/generic/exec with storage eden:temp fabled_roots.npc.orebringer