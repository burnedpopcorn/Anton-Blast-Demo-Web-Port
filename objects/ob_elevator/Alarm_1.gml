if (!instance_exists(ob_player))
{
    audio_stop_sound(sn_elevatorGoUp)
    audio_play_sound(sn_elevatorBell, 100, false)
    instance_create_layer(x, y, "Player", ob_player)
    alarm[2] = 1
}
