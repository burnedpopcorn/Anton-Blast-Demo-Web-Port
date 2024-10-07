animation_frame_counter()
assign_layer_objects()
currentX = x
currentY = y
spriteRotation -= 7
xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
speed_subpixel()
if (!b_pulled)
{
    verticalSpeed += gravitySpeed
    y += verticalSpeed
    if (spriteScale < 2)
        spriteScale += 0.2
    else
    {
        alarm[0] = 15
        b_pulled = 1
    }
}
if (b_following && (!b_collected))
{
    horizontalSpeed += 0.25
    move_towards_point(ob_player.x, (ob_player.y - 24), horizontalSpeed)
    if place_meeting(x, y, ob_player)
        b_collected = 1
}
if b_collected
{
    spriteScale -= 0.2
    speed = 0
    if (spriteScale < 0)
    {
        audio_play_sound(sn_collectBeet, 1, false)
        if (ob_player.playerHealth < ob_player.playerHealthMax)
        {
            ob_player.playerHealth += 1
            with (ob_healthCounter)
                self.spinLastHeart()
        }
        ob_healthCounter.spriteAlphaTimer = 240
        instance_destroy()
    }
}
