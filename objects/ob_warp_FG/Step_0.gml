if (collidingPlayer == noone)
{
    collidingPlayer = instance_place(x, y, ob_player)
    if (collidingPlayer != noone && collidingPlayer.myLayer == myLayer && (!collidingPlayer.b_warping))
    {
        collidingPlayer.b_warping = 1
        collidingPlayer.warpTimer = collidingPlayer.warpTimerMax
        collidingPlayer.horizontalSpeed = 0
        collidingPlayer.verticalSpeed = 0
        with (instance_create_layer(x, y, "System", ob_transitionPinhole))
        {
            onMidTransition = other.warpExecute
            self.setTransitionTime(round((other.collidingPlayer.warpTimerMax / 2)))
        }
    }
    else
        collidingPlayer = noone
}
