advancement revoke @s only fabled_roots:consumed_enchanted_scroll/flying_nimbus

execute \
    if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"vehicle":{}}} \
        run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"flying_nimbus"}

execute store result storage eden:temp enchanted_scroll.pitch int 1 run random value 0..8

function fabled_roots:item/enchanted_scroll/get_uuid

function fabled_roots:item/enchanted_scroll/usage with storage eden:temp enchanted_scroll
function fabled_roots:item/enchanted_scroll/flying_nimbus/exec with storage eden:temp enchanted_scroll