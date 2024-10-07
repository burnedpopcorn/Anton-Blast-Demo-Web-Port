event_inherited()
myLayer = 1
if (targetX == -1)
{
    var _centerX = (x + (sprite_width / 2))
    targetX = parallax_adjust(_centerX)
}
if (targetY == -1)
    targetY = (y - 24)
baseSprite = sp_spring_FG
launchSprite = sp_springBounce_FG
