$execute unless data storage eden:temp fabled_roots.npc{profession:"none"} run summon minecraft:mannequin ~ ~ ~ {\
    Tags:["fabled_roots.npc.$(race).generic","fabled_roots.npc.mannequin"],\
    equipment:{\
        head:{\
            id:"minecraft:music_disc_5",\
            count:1,\
            components:{\
                "minecraft:item_model":"fabled_roots:villager_hat_$(profession)"\
                }\
            }\
        },\
    attributes:[\
        {id:"minecraft:scale",base:$(size)},\
        {id:"minecraft:max_health",base:60}\
    ],\
    Health:60f,\
    CustomName:"$(race_cap)",\
    data:{\
        pitch:$(pitch),\
        profession:"$(profession)"\
    },\
    profile:{\
        texture:"fabled_roots:entity/npc/$(model)/$(race)/generic_$(id)"\
    }\
}

$execute if data storage eden:temp fabled_roots.npc{profession:"none"} run summon minecraft:mannequin ~ ~ ~ {\
    Tags:["fabled_roots.npc.$(race).generic","fabled_roots.npc.mannequin"],\
    attributes:[\
        {id:"minecraft:scale",base:$(size)},\
        {id:"minecraft:max_health",base:60}\
    ],\
    Health:60f,\
    CustomName:"$(race_cap)",\
    data:{\
        pitch:$(pitch),\
        profession:"$(profession)"\
    },\
    profile:{\
        texture:"fabled_roots:entity/npc/$(model)/$(race)/generic_$(id)"\
    }\
}

$summon villager ~ ~ ~ {\
    Tags:["mob_manager.settings.exclude","fabled_roots.npc.base"],\
    VillagerData:{profession:"minecraft:nitwit"},\
    Silent:1b,\
    Invulnerable:1b,\
    active_effects:[\
        {id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b}\
    ],\
    attributes:[\
        {id:"minecraft:movement_speed",base:0.5},\
        {id:"minecraft:scale",base:$(base_size)}\
    ]\
}

$execute if data storage eden:temp fabled_roots.npc{model:"slim"} run data modify entity @n[type=minecraft:mannequin,distance=..1,tag=fabled_roots.npc.$(race).generic] profile merge value {model:"slim"}

team join fabled_roots.npc @e[type=minecraft:mannequin,distance=..5,tag=fabled_roots.npc.mannequin]
team join fabled_roots.npc @e[type=minecraft:villager,distance=..5,tag=fabled_roots.npc.base]

$execute as @n[type=minecraft:mannequin,distance=..1,tag=fabled_roots.npc.$(race).generic] run function fabled_roots:npc/store_uuid/init
data modify entity @n[type=minecraft:villager,distance=..1,tag=fabled_roots.npc.base] data.attached_npc set from storage eden:temp fabled_roots.uuid.serialized