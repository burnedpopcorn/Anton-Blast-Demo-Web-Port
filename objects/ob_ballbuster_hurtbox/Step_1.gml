var _collidingPlayer = instance_place(x, y, ob_player)
if (_collidingPlayer != noone)
{
    if (_collidingPlayer.myLayer == myLayer && _collidingPlayer.currentState != playerstates.layerjump)
    {
        if (myEnemy.currentState == enemystates.charge)
        {
            myEnemy.horizontalSpeed = (2 * sign((myEnemy.spriteFacing * -1)))
            myEnemy.ballbusterStun()
        }
        if (_collidingPlayer.invincibilityTimer == 0)
        {
            _collidingPlayer.playerGetHurt()
            _collidingPlayer.horizontalSpeed = (2 * sign(myEnemy.spriteFacing))
            if (sprite_index == sp_ballbuster_hurtbox_idle)
                _collidingPlayer.verticalSpeed = -2
        }
    }
}
