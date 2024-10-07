animation_frame_counter()
audio_emitter_position(crateSoundEmit, x, y, 0)
var collidingPlayer = instance_place(x, (y - 1), ob_player)
var collidingPlayerBelow = instance_place(x, (y + 1), ob_player)
if collidingPlayer
{
    if (collidingPlayer.myLayer == myLayer)
        self.destructibleDestroy()
}
if collidingPlayerBelow
{
    if (collidingPlayerBelow.myLayer == myLayer)
        self.destructibleDestroy()
}
if place_meeting(x, y, ob_explosion)
    self.destructibleDestroy()
if place_meeting(x, y, ob_explosivecrate_explosion)
    self.destructibleDestroy()
if place_meeting(x, y, ob_trafficcone_FG)
    self.destructibleDestroy()
if place_meeting(x, y, ob_enemy_par)
    self.destructibleDestroy()
