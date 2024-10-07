if place_meeting(x, y, ob_player)
{
    if (!b_preparing)
    {
        audio_play_sound(sn_detonatorSet, 1, false)
        alarm[0] = 60
        ob_player.x = x
        ob_player.y = y
        sprite_index = sp_cannon_getIn
        with (ob_player)
        {
            b_fallingCannon = 0
            spriteImage = sp_anton_cannonFire
            spriteFrame = irandom_range(0, 3)
            spriteFrameSpeed = 0
            spriteAlpha = 0
            currentState = playerstates.dummy
        }
        b_preparing = 1
    }
}
