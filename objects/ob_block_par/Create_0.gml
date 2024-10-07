event_inherited()
debugvisible = false
onHitboxCollision = function(argument0)
{
    if (!destructible)
        return;
    var _strengthDifference = max(0, (strength - argument0.strength))
    if (_strengthDifference <= 1)
        self.destructibleDestroy()
    if (_strengthDifference >= 1)
		argument0.myPlayer.playerClutchHit()
}

