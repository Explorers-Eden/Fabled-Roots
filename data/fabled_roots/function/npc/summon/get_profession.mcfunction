execute store result score $profession fabled_roots.technical run random value 1..19

execute if score $profession fabled_roots.technical matches 1..10 run data modify storage eden:temp fabled_roots.npc.profession set value "none"

execute if score $profession fabled_roots.technical matches 11 run data modify storage eden:temp fabled_roots.npc.profession set value "librarian"
execute if score $profession fabled_roots.technical matches 12 run data modify storage eden:temp fabled_roots.npc.profession set value "armorer"
execute if score $profession fabled_roots.technical matches 13 run data modify storage eden:temp fabled_roots.npc.profession set value "butcher"
execute if score $profession fabled_roots.technical matches 14 run data modify storage eden:temp fabled_roots.npc.profession set value "cartographer"
execute if score $profession fabled_roots.technical matches 15 run data modify storage eden:temp fabled_roots.npc.profession set value "farmer"
execute if score $profession fabled_roots.technical matches 16 run data modify storage eden:temp fabled_roots.npc.profession set value "fisherman"
execute if score $profession fabled_roots.technical matches 17 run data modify storage eden:temp fabled_roots.npc.profession set value "fletcher"
execute if score $profession fabled_roots.technical matches 18 run data modify storage eden:temp fabled_roots.npc.profession set value "shepherd"
execute if score $profession fabled_roots.technical matches 19 run data modify storage eden:temp fabled_roots.npc.profession set value "weaponsmith"