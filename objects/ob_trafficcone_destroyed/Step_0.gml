var _temp_local_var_1;
animation_frame_counter()
assign_layer_objects()
currentX = x
currentY = y
xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
audio_emitter_position(coneSoundEmit, xPosition, y, 0)
speed_subpixel()
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
b_onGround = (check_below() || check_below_passthrough())
verticalSpeed += gravitySpeed
spriteRotation += (6 * sign(horizontalSpeed))
if place_meeting(x, (y + 1), myBlock)
{
    verticalSpeed = random_range(-2, -4)
    audio_emitter_pitch(coneSoundEmit, random_range(0.9, 1.1))
    audio_play_sound_on(coneSoundEmit, sn_trafficCone2, false, 1)
    alarm[0] = 1
}
else if place_meeting((x + horizontalSpeed), y, myBlock)
{
    audio_emitter_pitch(coneSoundEmit, random_range(0.9, 1.1))
    audio_play_sound_on(coneSoundEmit, sn_trafficCone, false, 1)
    verticalSpeed = random_range(-1, -3)
    horizontalSpeed = (random_range(-2, -4) * sign(horizontalSpeed))
    alarm[0] = 1
}
x = round(x)
y = round(y)
