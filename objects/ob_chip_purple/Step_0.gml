event_inherited()
if (!b_collected)
{
    oscillateTimer++
    oscillateFrequency = 0.05
    oscillateAmplitude = 3
    y = (yPosition + (sin((oscillateTimer * oscillateFrequency)) * oscillateAmplitude))
}
else if b_collected
{
    if (!audio_is_playing(sn_chipCollectMega))
        audio_play_sound(sn_chipCollectMega, 1, false)
    if ((!audio_is_playing(sn_antonVoice_happyLaugh)) && (!audio_is_playing(sn_antonVoice_happyLaugh2)))
        audio_play_sound(choose(sn_antonVoice_happyLaugh, sn_antonVoice_happyLaugh2), 1, false)
}
