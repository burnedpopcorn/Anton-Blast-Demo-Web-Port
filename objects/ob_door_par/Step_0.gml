if (collidingPlayer == noone)
{
    collidingPlayer = instance_place(x, y, ob_player)
    if (collidingPlayer != noone && collidingPlayer.myLayer == myLayer && (!collidingPlayer.b_warping) && collidingPlayer.upKey && collidingPlayer.currentState == playerstates.normal)
    {
        collidingPlayer.b_warping = 1
        collidingPlayer.warpTimer = collidingPlayer.warpTimerMax
        collidingPlayer.horizontalSpeed = 0
        collidingPlayer.verticalSpeed = 0
		image_speed = 0.5
        audio_play_sound(sn_transitionEnterDoor, 1, false)
        with (instance_create_layer(x, y, "System", ob_transitionPinhole))
        {
            onMidTransition = other.warpExecute
            self.setTransitionTime(round((other.collidingPlayer.warpTimerMax / 2)))
        }
    }
    else
        collidingPlayer = noone
}
if (image_index == (sprite_get_number(sprite_index) - 1))
{
	image_index = sprite_get_number(sprite_index) - 1
	image_speed = 0
}