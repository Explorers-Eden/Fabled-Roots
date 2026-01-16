$data modify storage eden:settings fabled_roots merge value {starter_equip:$(starter_equip),npc_spawning:$(npc_spawning),pvp:$(pvp),prefix:$(prefix),seeinvis:$(seeinvis)}

execute if data storage eden:settings fabled_roots{starter_equip:"always"} run data modify storage eden:settings fabled_roots.starter_equip_initial set value "false"
execute unless data storage eden:settings fabled_roots{starter_equip:"always"} run data modify storage eden:settings fabled_roots.starter_equip_initial set value "true"

execute if data storage eden:settings fabled_roots{npc_spawning:"enabled"} run data modify storage eden:settings fabled_roots.npc_spawning_initial set value "false"
execute unless data storage eden:settings fabled_roots{npc_spawning:"enabled"} run data modify storage eden:settings fabled_roots.npc_spawning_initial set value "true"

execute if data storage eden:settings fabled_roots{pvp:"enabled"} run data modify storage eden:settings fabled_roots.pvp_initial set value "false"
execute unless data storage eden:settings fabled_roots{pvp:"enabled"} run data modify storage eden:settings fabled_roots.pvp_initial set value "true"

execute if data storage eden:settings fabled_roots{prefix:"enabled"} run data modify storage eden:settings fabled_roots.prefix_initial set value "false"
execute unless data storage eden:settings fabled_roots{prefix:"enabled"} run data modify storage eden:settings fabled_roots.prefix_initial set value "true"

execute if data storage eden:settings fabled_roots{seeinvis:"enabled"} run data modify storage eden:settings fabled_roots.seeinvis_initial set value "false"
execute unless data storage eden:settings fabled_roots{seeinvis:"enabled"} run data modify storage eden:settings fabled_roots.seeinvis_initial set value "true"

function fabled_roots:teams/friendlyfire
function fabled_roots:teams/prefix
function fabled_roots:teams/seefriendlyinvisibles