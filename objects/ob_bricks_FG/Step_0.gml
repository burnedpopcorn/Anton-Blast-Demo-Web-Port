animation_frame_counter()
var collidingPlayer = instance_place(x, (y - 1), ob_player)
var collidingPlayerBelow = instance_place(x, (y + 1), ob_player)
if collidingPlayerBelow
{
    if (collidingPlayerBelow.myLayer == myLayer)
        self.destructibleDestroy()
}
if place_meeting(x, y, ob_explosion)
    self.destructibleDestroy()
