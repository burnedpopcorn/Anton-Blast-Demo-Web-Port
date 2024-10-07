unpause = function()
{
    audio_resume_all()
    audio_play_sound(sn_pauseEnd, 1, false)
    b_paused = 0
    instance_activate_all()
    instance_destroy(ob_pauseMenu)
}

b_paused = 0
