event_inherited()
b_activated = 0
b_canActivate = 1
alarm[0] = 1
onHitboxCollision = function(argument0)
{
    if instance_exists(ob_diceManager)
    {
        if b_canActivate
        {
            alarm[1] = 30
            image_speed = 1
            screenshake(1, 1, 25, 10)
            if (ob_diceManager.b_redDiceOn == 0)
            {
                audio_play_sound(sn_enemyPaletteShift, 1, false)
                b_activated = 1
                ob_diceManager.b_redDiceOn = 1
            }
            else if ob_diceManager.b_redDiceOn
            {
                audio_play_sound(sn_enemyPaletteShift2, 1, false)
                b_activated = 0
                ob_diceManager.b_redDiceOn = 0
            }
            argument0.myPlayer.playerClutchHit()
            b_canActivate = 0
        }
        image_index = 0
    }
}

