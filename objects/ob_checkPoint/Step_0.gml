var _meetingPlayer = instance_place(x, y, ob_player)
if (_meetingPlayer != noone && _meetingPlayer.myLayer == myLayer)
{
	if (sprite_index == sp_checkpoint_idle && global.checkpointRoom != room)
	{
		global.checkpointRoom = room
		global.checkpointX = x
		global.checkpointY = y
		audio_play_sound(sn_checkpoint, 1, false)
		sprite_index = sp_checkpoint_activate
	}
}