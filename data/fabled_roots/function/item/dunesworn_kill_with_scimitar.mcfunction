advancement revoke @s only fabled_roots:dunesworn_kill_with_scimitar

# Saturation fills 1 hunger and 2 saturation every tick, so even 1 second fills the whole bar:
# it only lasts 2 ticks (about one drumstick), then it's cleared again.
effect give @s minecraft:saturation 1 0 true
tag @s add fabled_roots.scimitar_saturation
schedule function fabled_roots:item/dunesworn_scimitar_saturation_end 2t replace
