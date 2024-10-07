function playerState_Hurt()
{
    self.updateHitbox()
    if (voiceHurtTimer != 0)
        voiceHurtTimer -= 1
    if (voiceHurtTimer == 0)
    {
        audio_play_sound(choose(sn_antonVoice_hurtGrr, sn_antonVoice_hurtEargh, sn_antonVoice_hurtAah, sn_antonVoice_annoyedHey, sn_antonVoice_annoyedOhBoy, sn_antonVoice_happyLaugh), 1, false)
        voiceHurtTimer = -1
    }
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    if (myLayer == 1)
        var knockbackSpeed = 1
    else
        knockbackSpeed = 0.5
    if (stunTimer > 0)
        stunTimer -= 1
    if (stunTimer == 0 && b_onGround)
        currentState = playerstates.normal
}

