$summon minecraft:mannequin ~ ~ ~ {\
    Tags:["fabled_roots.npc.orebringer.generic","fabled_roots.npc.mannequin"],\
    attributes:[\
        {id:"minecraft:scale",base:$(size)},\
        {id:"minecraft:max_health",base:60}\
    ],\
    Health:60f,\
    CustomName:"Orebringer",\
    profile:{texture:"fabled_roots:entity/npc/orebringer/generic_$(id)",model:"slim"},\
    Passengers:[\
        {\
            id:"minecraft:armor_stand",\
            Small:1b,\
            Marker:1b,\
            Invisible:1b,\
            NoBasePlate:1b,\
            attributes:[{id:"minecraft:scale",base:0.1}],\
            Tags:["fabled_roots.npc.mount"]\
        }\
    ]\
}

summon villager ~ ~ ~ {\
    Tags:["mob_manager.settings.exclude","fabled_roots.npc.base"],\
    Silent:1b,\
    Invulnerable:1b,\
    active_effects:[\
        {id:"minecraft:invisibility",amplifier:1,duration:-1,show_particles:0b}\
    ],\
    attributes:[\
        {id:"minecraft:movement_speed",base:0.5},\
        {id:"minecraft:scale",base:0.01}\
    ]\
}

execute as @n[type=minecraft:mannequin,distance=..1,tag=fabled_roots.npc.orebringer.generic] run function fabled_roots:npc/store_uuid/init
data modify entity @n[type=minecraft:villager,distance=..1,tag=fabled_roots.npc.base] data.attached_npc set from storage eden:temp fabled_roots.uuid.serialized