if (timerTime > 0)
{
    timerTime -= 1
    alarm[0] = 60
}
else if b_runbackStarted
{
    b_runbackEnded = 1
    with (ob_player)
    {
        instance_create_depth(xPosition, y, -10000, ob_antonDied)
        currentState = playerstates.death
        instance_create_depth(xPosition, y, -1000, ob_explosion)
        audio_play_sound(sn_runbackExpire, 1, false)
    }
    screenshake(1, 1, 120, 40)
    b_runbackPrepare = 0
    b_runbackPushed = 0
    b_runbackStarted = 0
}
