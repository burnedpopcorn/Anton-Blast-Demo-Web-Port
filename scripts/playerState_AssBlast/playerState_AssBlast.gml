function playerState_AssBlast()
{
    coyoteTimeCounter = 0
    if (!b_assBlastCollided)
    {
        if (verticalSpeed > 0)
            self.updateHitbox(sp_assBlastHitbox, 2)
        else
            self.updateHitbox()
        if (!audio_is_playing(sn_antonAssBlast))
            audio_play_sound_on(playerSoundEmit, sn_antonAssBlast, true, 100)
        if leftKey
            horizontalSpeed = approach(horizontalSpeed, -2.5, 0.1)
        else if rightKey
            horizontalSpeed = approach(horizontalSpeed, 2.5, 0.1)
        else
            horizontalSpeed = approach(horizontalSpeed, 0, 0.075)
        verticalSpeed = approach(verticalSpeed, assBlastSpeed, assBlastAcceleration)
        if (verticalSpeed > assBlastSpeed)
            verticalSpeed = assBlastSpeed
        if (!downKey)
        {
            audio_stop_sound(sn_antonAssBlast)
            verticalSpeed = maxFallSpeed
            currentState = playerstates.normal
        }
        if b_onGround
            self.playerAssBlastLand()
    }
    else if b_assBlastCollided
    {
        assBlastRecoveryTimer -= 1
        if (assBlastRecoveryTimer == 0)
        {
            b_assBlastCollided = 0
            currentState = playerstates.normal
        }
    }
}

