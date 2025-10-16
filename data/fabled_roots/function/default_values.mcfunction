data modify storage eden:settings fabled_roots merge value {\
    pvp:disabled,\
    pvp_initial:true,\
    prefix:enabled,\
    prefix_initial1:false,\
    seeinvis:enabled,\
    seeinvis_initial:false,\
    npc_spawning:enabled,\
    npc_spawning_initial:false,\
    command_template:"function fabled_roots:dialog/command_template/config {npc_spawning:$(npc_spawning),pvp:$(pvp),prefix:$(prefix),seeinvis:$(seeinvis)}"\
}