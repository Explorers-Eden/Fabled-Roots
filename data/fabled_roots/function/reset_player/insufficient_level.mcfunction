execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2
tellraw @s [\
{"text":"▊ ","color":"#FF4A4A","bold":true,"italic":false},\
{"bold":false,"color":"white","fallback":"You need at least 100 Exp Levels to reset.","italic":false,"translate":"text.fabled_roots.insufficient_level"}\
]