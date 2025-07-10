scoreboard players set @s fabled_roots.bard.timer.active 1
scoreboard players set @s fabled_roots.exp.player 1

execute as @s[advancements={fabled_roots:bard_used_admire_goat_horn=true}] run effect give @a[distance=..8] minecraft:regeneration 10 1 false
execute as @s[advancements={fabled_roots:bard_used_call_goat_horn=true}] run tp @e[type=item,distance=..16] @s
execute as @s[advancements={fabled_roots:bard_used_dream_goat_horn=true}] run effect give @a[distance=..8] minecraft:conduit_power 15 1 false
execute as @s[advancements={fabled_roots:bard_used_ponder_goat_horn=true}] run effect give @e[type=#eden:hostile,distance=..16] minecraft:wither 5 0 false
execute as @s[advancements={fabled_roots:bard_used_seek_goat_horn=true}] run effect give @e[type=!#eden:non_living,distance=0.1..16] minecraft:glowing 10 0 false
execute as @s[advancements={fabled_roots:bard_used_sing_goat_horn=true}] run effect give @a[distance=..8] minecraft:jump_boost 10 1 false
execute as @s[advancements={fabled_roots:bard_used_yearn_goat_horn=true}] run effect give @a[distance=..8] minecraft:resistance 10 2 false

execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:poison
execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:wither
execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:weakness
execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:slowness
execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:nausea
execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:hunger
execute as @s[advancements={fabled_roots:bard_used_feel_goat_horn=true}] run effect clear @a[distance=..8] minecraft:blindness