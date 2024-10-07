if (sprite_index == sp_manholeFloorEnter)
{
    if (image_index == 5 && (!audio_is_playing(sn_manholeLand)))
        audio_play_sound(sn_manholeLand, 1, false)
    if (image_index == 12 && (!audio_is_playing(sn_manholeWrap)))
        audio_play_sound(sn_manholeWrap, 1, false)
}
else if (sprite_index == sp_manholeFloorExit)
{
    if (image_index == 13 && (!audio_is_playing(sn_manholeLand)))
        audio_play_sound(sn_manholeLand, 1, false)
    if (image_index == 20 && (!audio_is_playing(sn_manholeWrap)))
        audio_play_sound(sn_manholeWrap, 1, false)
}
