summon mannequin ~ ~ ~ {\
    Health:9999f,\
    Invulnerable:0b,\
    immovable:1b,\
    Tags:["fabled_roots.decoy"],\
    attributes:[\
        {id:"minecraft:knockback_resistance",base:255},\
        {id:"minecraft:max_health",base:9999},\
        {id:"minecraft:movement_speed",base:0},\
        {id:"minecraft:burning_time",base:0},\
        {id:"minecraft:safe_fall_distance",base:1000},\
        {id:"minecraft:armor",base:1000},\
        {id:"minecraft:armor_toughness",base:1000},\
        {id:"minecraft:scale",base:1}\
    ],\
    profile:{texture:"fabled_roots:entity/decoy",model:"wide"}\
}

$rotate @n[type=minecraft:mannequin,tag=fabled_roots.decoy,distance=..2] $(rotation) 0
team join fabled_roots.decoy @e[type=mannequin,tag=fabled_roots.decoy]