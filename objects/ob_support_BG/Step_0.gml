animation_frame_counter()
assign_layer_objects()
var collidingPlayerBelow = instance_place(x, (y + 1), ob_player)
if collidingPlayerBelow
{
    if (collidingPlayerBelow.myLayer == myLayer)
        self.destructibleDestroy()
}
if place_meeting(x, y, myExplosion)
    self.destructibleDestroy()
