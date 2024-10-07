if (sprite_index == sp_manholeCeilingEnter)
{
    if (image_index == 10 && (!audio_is_playing(sn_manholeWrap)))
        audio_play_sound(sn_manholeWrap, 1, false)
}
else if (sprite_index == sp_manholeCeilingExit)
{
    if (image_index == 17 && (!audio_is_playing(sn_manholeWrap)))
        audio_play_sound(sn_manholeWrap, 1, false)
}
if (image_speed != 0)
    return;
var _meetingPlayer = instance_place(x, y, ob_player)
if (_meetingPlayer != noone && _meetingPlayer.myLayer == myLayer && _meetingPlayer.upKey && _meetingPlayer.currentState == playerstates.normal)
    self.warpStart()
