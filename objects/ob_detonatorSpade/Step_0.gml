var collidingPlayer = instance_place(x, (y - 1), ob_player)
if collidingPlayer
{
    if (collidingPlayer.myLayer == myLayer && collidingPlayer.verticalSpeed > -0.01 && (!b_detonatorSet))
    {
        if (collidingPlayer.currentState == playerstates.assblast)
            collidingPlayer.playerAssBlastLand()
        else
        {
            collidingPlayer.y -= 1
            collidingPlayer.verticalSpeed = (collidingPlayer.jumpPower * 0.85)
            collidingPlayer.spriteImage = sp_anton_jump
        }
        alarm[1] = 60
        sprite_index = sp_detonatorSpadeSet
        ob_detonatorManager.b_spadeSet = 1
        audio_play_sound(sn_detonatorSet, 1, false)
        b_detonatorSet = 1
    }
}
