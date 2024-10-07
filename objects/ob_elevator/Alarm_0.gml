if (!instance_exists(ob_player))
{
    audio_play_sound(sn_elevatorGoUp, 100, false)
    screenshake(0, 1, 220, 15)
    alarm[1] = 1
}
