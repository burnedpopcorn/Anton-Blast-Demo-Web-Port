animation_frame_counter()
assign_layer_objects()
spriteFacing = sign(horizontalSpeed)
currentX = x
currentY = y
x += horizontalSpeed
y += verticalSpeed
xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
speed_subpixel()
verticalSpeed += gravitySpeed
if (place_meeting(x, (y + 1), myBlock) && (!b_touchedGround))
{
    verticalSpeed = random_range(-2, -4)
    b_touchedGround = 1
}
