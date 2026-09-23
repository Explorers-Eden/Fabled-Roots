scoreboard players set @s fabled_roots.dialog_trigger.info 0
execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2

tellraw @s {"text":"-----------------------------------------","color":"dark_gray","bold":true,"italic":false}

$tellraw @s [\
    {"bold":false,"color":"white","fallback":"Your current Race:","italic":false,"translate":"message.fabled_roots.current_race"},\
    " ",\
    {"bold":true,"color":"$(hex_color)","hover_event":{"action":"show_text","value":[{"translate":"option.fabled_roots.$(race).tooltip.stats","fallback":"$(race)","color":"white","bold":false,"italic":false}]},"italic":false,"translate":"option.fabled_roots.$(race)","fallback":"$(race)"}\
]
$tellraw @s {"bold":false,"color":"gray","italic":false,"translate":"option.fabled_roots.$(race).tooltip.description","fallback":"$(race)"}

tellraw @s " "

$tellraw @s [\
    {"bold":false,"color":"white","fallback":"Your current Class:","italic":false,"translate":"message.fabled_roots.current_class"},\
    " ",\
    {"bold":true,"color":"white","hover_event":{"action":"show_text","value":[{"translate":"option.fabled_roots.$(class).tooltip.stats","fallback":"$(class)","color":"white","bold":false,"italic":false}]},"italic":false,"translate":"option.fabled_roots.$(class)","fallback":"$(class)"}\
]
$tellraw @s {"bold":false,"color":"gray","italic":false,"translate":"option.fabled_roots.$(class).tooltip.description","fallback":"$(class)"}

tellraw @s {"text":"-----------------------------------------","color":"dark_gray","bold":true,"italic":false}


data remove storage eden:temp player_info