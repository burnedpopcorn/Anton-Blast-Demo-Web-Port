if place_meeting(x, y, ob_explosion)
{
    ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
    audio_play_sound(sn_importantSecret, 1, false)
    instance_destroy()
}
