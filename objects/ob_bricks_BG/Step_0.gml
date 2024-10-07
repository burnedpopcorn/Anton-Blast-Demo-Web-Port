animation_frame_counter()
assign_layer_objects()
xPosition = (currentX + (camera_get_view_x(view_camera[0]) * 0.5))
var collidingPlayer = instance_place(x, (y - 1), ob_player)
var collidingPlayerBelow = instance_place(x, (y + 1), ob_player)
if collidingPlayerBelow
{
    if (collidingPlayerBelow.myLayer == myLayer)
        self.destructibleDestroy()
}
if collidingPlayer
{
	if (collidingPlayer.myLayer == myLayer)
	{
	}
}
if place_meeting(x, y, myExplosion)
    self.destructibleDestroy()
