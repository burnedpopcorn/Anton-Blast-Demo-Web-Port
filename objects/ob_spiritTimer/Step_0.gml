xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
audio_emitter_position(timerSoundEmit, xPosition, y, 0)
var _collidingPlayer = instance_place(x, (y - 1), ob_player)
if (_collidingPlayer && (!b_activated))
{
    if (_collidingPlayer.verticalSpeed > -0.01 && _collidingPlayer.myLayer == myLayer)
    {
        screenshake(1, 1, 50, 30)
        sprite_index = sp_spiritTimer_activated
        audio_play_sound(sn_spiritTimer, 1, false)
        image_index = 0
        b_activated = 1
        ob_runbackManager.runbackStart()
        alarm[1] = 2
        alarm[4] = 30
    }
}
if spinningAnimation
{
    minuteHandRotation -= 12
    hourHandRotation -= 5
}
if instance_exists(ob_player)
{
    if (ob_player.currentState == playerstates.reactcannon && (!ob_player.b_fallingCannon))
        mask_index = sp_empty
    else
        mask_index = sprite_index
}
