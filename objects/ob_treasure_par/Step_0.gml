var _temp_local_var_4;
animation_frame_counter()
assign_layer_objects()
currentX = x
currentY = y
xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
speed_subpixel()
if (!b_collected)
{
    spriteScale = layerDepth
	repeat (abs(verticalVelocity))
	{
	    if ((!(place_meeting(x, (y + sign(verticalVelocity)), myBlock))) && (!check_below_passthrough()))
	        y += sign(verticalVelocity)
	    else if (check_below() || check_below_passthrough())
	    {
	        verticalVelocity = 0
	        verticalVelocity_subpixel = 0
			break
	    }
	}
    repeat (abs(horizontalVelocity))
    {
        if (place_meeting((x + sign(horizontalVelocity)), y, myBlock) && (!(place_meeting((x + sign(horizontalVelocity)), (y - 1), myBlock))))
            y -= 1
        if ((!(place_meeting((x + sign(horizontalVelocity)), y, myBlock))) && (!(place_meeting((x + sign(horizontalVelocity)), (y + 1), myBlock))) && place_meeting((x + sign(horizontalVelocity)), (y + 2), myBlock))
            y += 1
        if (!(place_meeting((x + sign(horizontalVelocity)), y, myBlock)))
            x += sign(horizontalVelocity)
        else
        {
            horizontalVelocity = 0
            horizontalVelocity_subpixel = 0
			break
        }
    }
    if b_hasGravity
        b_onGround = (check_below() || check_below_passthrough())
    if b_canDespawn
    {
        despawnTimer -= 1
        if (despawnTimer == 0)
            instance_destroy(self)
    }
    if (b_hasGravity == 1)
        verticalSpeed += gravitySpeed
    var collidingPlayer = instance_place(x, y, ob_player)
    if collidingPlayer
    {
        if (collidingPlayer.myLayer == myLayer && collidingPlayer.currentState != playerstates.layerjump)
        {
            if instance_exists(ob_treasureCounter)
                ob_treasureCounter.spriteAlphaTimer = 240
            audio_stop_sound(treasureCollectSound)
            audio_sound_pitch(treasureCollectSound, random_range(0.95, 1.05))
            audio_play_sound(treasureCollectSound, 1, false)
            instance_create_depth(xPosition, (y - 4), -1000, treasureParticle)
            x = xPosition
            myLayer = 1
            b_collected = 1
        }
    }
}
else if b_collected
{
    if instance_exists(ob_treasureManager)
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
    horizontalSpeed += 0.25
    if (horizontalSpeed > 30)
    {
        if instance_exists(ob_treasureCounter)
        {
            ob_treasureCounter.actualScore += treasureValue
            with (ob_treasureCounter)
            {
                image_index = 0
                spriteScale += 1
                audio_stop_sound(sn_treasureCounter1)
                audio_stop_sound(sn_treasureCounter2)
                audio_stop_sound(sn_treasureCounter3)
                audio_play_sound(choose(sn_treasureCounter1, sn_treasureCounter2, sn_treasureCounter3), 1, false)
            }
            instance_destroy()
        }
    }
    image_speed = 2
    depth = -500
    persistent = 1
    if instance_exists(ob_treasureCounter)
        move_towards_point((ob_treasureCounter.x - 66), (ob_treasureCounter.y + 3), horizontalSpeed)
    else
        instance_destroy()
    if instance_exists(ob_antonDied)
        instance_destroy()
}
x = round(x)
y = round(y)
