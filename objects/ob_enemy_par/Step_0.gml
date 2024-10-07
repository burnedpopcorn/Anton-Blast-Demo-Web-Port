var _temp_local_var_3;
audio_emitter_position(enemySoundEmit, xPosition, y, 0)
animation_frame_counter()
assign_layer_objects()
move_wrap(1, 1, sprite_width)
b_onScreen = point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + 384), (camera_get_view_y(view_camera[0]) + 216))
if ((!b_activated) && b_onScreen)
    b_activated = 1
with (instance_place((x + horizontalSpeed), (y + verticalSpeed), ob_explosivecrate_FG))
    self.destructibleDestroy()
if place_meeting(x, y, ob_explosivecrate_explosion)
    instance_destroy()
if (stunHitTimer > 0)
    stunHitTimer -= 1
else
    stunHitTimer = 0
currentX = x
currentY = y
xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
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
x = round(x)
y = round(y)
