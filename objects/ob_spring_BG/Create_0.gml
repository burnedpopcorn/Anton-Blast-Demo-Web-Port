event_inherited()
myLayer = 2
if (targetX == -1)
{
    var _centerX = (x + (sprite_width / 2))
    targetX = parallax_adjust(_centerX, 1)
}
if (targetY == -1)
    targetY = (y + 24)
baseSprite = sp_spring_BG
launchSprite = sp_springBounce_BG
