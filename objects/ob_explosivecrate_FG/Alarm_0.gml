palette = 1
audio_stop_sound(sn_treasureTick)
audio_sound_pitch(sn_treasureTick, random_range(0.5, 0.8))
audio_play_sound_on(crateSoundEmit, sn_treasureTick, false, 1)
alarm[1] = 4
