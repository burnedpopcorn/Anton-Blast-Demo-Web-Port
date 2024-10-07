event_inherited()
depth = -1001
onHitboxCollision = function(argument0)
{
    if (argument0.sprite_index == sp_assBlastHitbox)
    {
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
        audio_play_sound(sn_supportBreak, 1, false)
        alarm[1] = 30
        sprite_index = sp_empty
        mask_index = sp_empty
    }
}

