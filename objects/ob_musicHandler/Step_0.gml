if instance_exists(ob_runbackManager)
{
    if (ob_runbackManager.b_runbackEnded || instance_exists(ob_antonDied))
    {
        audio_stop_sound(levelSong1)
        audio_stop_sound(levelSong2)
        audio_stop_sound(levelSong3)
        audio_stop_sound(levelSong4)
        audio_stop_sound(mu_happyhour)
        return;
    }
	
    if (!ob_runbackManager.b_runbackPushed && ob_runbackManager.b_levelStarted)
    {
        if (!audio_is_playing(levelSong1))
            audio_play_sound(levelSong1, 100, true, settings().musicVolume)
        if (!audio_is_playing(levelSong2))
            audio_play_sound(levelSong2, 100, true, settings().musicVolume)
        if (!audio_is_playing(levelSong3))
            audio_play_sound(levelSong3, 100, true, settings().musicVolume)
        if (!audio_is_playing(levelSong4))
            audio_play_sound(levelSong4, 100, true, settings().musicVolume)
        if (!audio_is_playing(levelSong5))
        {
            audio_sound_gain(levelSong5, 0, 0)
            audio_play_sound(levelSong5, 100, true, settings().musicVolume)
        }
		
        if (global.roomSong == 1)
        {
            audio_sound_gain(levelSong1, settings().musicVolume, 1000)
            audio_sound_gain(levelSong2, 0, 1000)
            audio_sound_gain(levelSong3, 0, 1000)
            audio_sound_gain(levelSong4, 0, 1000)
            audio_sound_gain(levelSong5, 0, 1000)
        }
        else if (global.roomSong == 2)
        {
            audio_sound_gain(levelSong3, 0, 1000)
            audio_sound_gain(levelSong2, settings().musicVolume, 1000)
            audio_sound_gain(levelSong1, 0, 1000)
            audio_sound_gain(levelSong4, 0, 1000)
            audio_sound_gain(levelSong5, 0, 1000)
        }
        else if (global.roomSong == 3)
        {
            audio_sound_set_track_position(levelSong1, 0)
            audio_sound_set_track_position(levelSong2, 0)
            audio_sound_gain(levelSong3, settings().musicVolume, 1000)
            audio_sound_gain(levelSong2, 0, 1000)
            audio_sound_gain(levelSong1, 0, 1000)
            audio_sound_gain(levelSong4, 0, 1000)
            audio_sound_gain(levelSong5, 0, 1000)
        }
        else if (global.roomSong == 4)
        {
            audio_sound_set_track_position(levelSong1, 0)
            audio_sound_set_track_position(levelSong2, 0)
            audio_sound_gain(levelSong3, 0, 1000)
            audio_sound_gain(levelSong2, 0, 1000)
            audio_sound_gain(levelSong1, 0, 1000)
            audio_sound_gain(levelSong4, settings().musicVolume, 1000)
            audio_sound_gain(levelSong5, 0, 1000)
        }
        else if (global.roomSong == 5)
        {
            audio_sound_gain(levelSong3, 0, 1000)
            audio_sound_gain(levelSong2, 0, 1000)
            audio_sound_gain(levelSong1, 0, 1000)
            audio_sound_gain(levelSong4, 0, 1000)
            audio_sound_gain(levelSong5, settings().musicVolume, 1000)
        }
        else
        {
            audio_sound_gain(levelSong3, 0, 1000)
            audio_sound_gain(levelSong2, 0, 1000)
            audio_sound_gain(levelSong1, 0, 1000)
            audio_sound_gain(levelSong4, 0, 1000)
        }
    }
    if ob_runbackManager.b_runbackPushed
    {
        if (!audio_is_playing(mu_happyhour))
        {
            audio_stop_sound(levelSong1)
            audio_stop_sound(levelSong2)
			
            audio_play_sound(mu_happyhour, 100, true)
            audio_sound_gain(mu_happyhour, settings().musicVolume, 1000)
        }
    }
}
