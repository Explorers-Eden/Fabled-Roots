advancement revoke @s only fabled_roots:consumed_enchanted_scroll/dry_heat

execute store result score @s fabled_roots.exp.player.level run experience query @s levels
execute if score @s fabled_roots.exp.player.level matches ..29 run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"dry_heat"}
execute unless items entity @s hotbar.* minecraft:wet_sponge \
        unless items entity @s inventory.* minecraft:wet_sponge \
        unless items entity @s weapon.offhand minecraft:wet_sponge \
            run return run function fabled_roots:item/enchanted_scroll/cancel {scroll:"dry_heat"}

execute store result storage fabled_roots:temp enchanted_scroll.pitch int 1 run random value 0..8

execute as @s[tag=fabled_roots.dunesworn] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..5
execute as @s[tag=!fabled_roots.dunesworn] store result storage fabled_roots:temp enchanted_scroll.level int 1 run random value 1..10

function fabled_roots:item/enchanted_scroll/usage with storage fabled_roots:temp enchanted_scroll
function fabled_roots:item/enchanted_scroll/dry_heat/exec