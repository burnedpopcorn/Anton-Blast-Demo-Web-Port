var _collidingPlayer = instance_place(x, y, ob_player)
if (_collidingPlayer != noone && _collidingPlayer.myLayer == myLayer)
{
    if (tileAlpha2 > 0)
        tileAlpha2 -= 0.1
    else
        tileAlpha2 = 0
}
else if (tileAlpha2 < 1)
    tileAlpha2 += 0.1
else
    tileAlpha2 = 1
