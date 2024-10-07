function playerState_Roll()
{
    if b_rolling
    {
        rollingTimer = 0
        assign_layer_mask(sp_playerMaskCrouchFG, sp_playerMaskCrouchBG)
        create_player_particle()
        self.updateHitbox(sp_clutchHitbox, 5)
        horizontalSpeed = approach(horizontalSpeed, (rollSpeed * sign(spriteFacing)), 0.25)
    }
    else
    {
        self.updateHitbox(sp_clutchHitbox, 0)
        var _collisionSlope = instance_place(x, (y + 1), mySlope)
        if (_collisionSlope != noone)
            spriteFacing = _collisionSlope.getDirection()
        horizontalSpeed = approach(horizontalSpeed, (rollSpeed * spriteFacing), 0.1)
        rollingTimer += 1
        if (rollingTimer == rollingTimerMax)
        {
            audio_play_sound(sn_antonRollStart, 1, false)
            audio_play_sound(sn_antonRoll, 1, true)
            audio_play_sound(choose(sn_antonVoice_annoyedHey, sn_antonVoice_annoyedOhBoy, sn_antonVoice_happyLaugh, sn_antonVoice_happyLaugh2, sn_antonVoice_hurtGrr), 1, false)
            rollingTimer = 0
            b_rolling = 1
        }
    }
    if (!b_onGround)
    {
        if (coyoteTimeCounter > 0)
            coyoteTimeCounter -= 1
    }
    if (jumpKey || jumpBufferCounter > 0)
    {
        if (((!b_jumped) && b_onGround) || coyoteTimeCounter > 0)
        {
            if (!b_rolling)
            {
                rollingTimer = 0
                currentState = playerstates.normal
            }
            audio_stop_sound(jumpSound)
            audio_play_sound(jumpSound, 1, false)
            jumpBufferCounter = 0
            coyoteTimeCounter = 0
            verticalSpeed = jumpPower
            b_jumped = 1
        }
    }
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    var _meetingBlock = instance_place((x + sign(horizontalSpeed)), y, myBlock)
    if (_meetingBlock != noone && (!(object_is_ancestor(_meetingBlock.object_index, mySlope))))
    {
        if (!(place_meeting(x, (y - 1), myBlock)))
        {
            y -= 1
            if b_onGround
                verticalSpeed = -3
        }
        horizontalSpeed = (-4 * spriteFacing)
        b_rolling = 0
        audio_stop_sound(sn_antonRoll)
        audio_stop_sound(sn_antonBump)
        audio_play_sound(sn_antonBump, 1, false)
        audio_play_sound(sn_bounce, 1, false)
        screenshake(1, 0, 10, 10)
        spriteFrame = 0
        spriteImage = sp_anton_ball_hit
        spriteFrameSpeed = 0.33
        b_transitioning = 1
        currentState = playerstates.rollhit
        return;
    }
}

