function playerState_Slide()
{
    self.updateHitbox(sp_slideHitbox, 1)
    if (clutchCooldownTimer > 0)
        clutchCooldownTimer -= 1
    assign_layer_mask(sp_playerMaskCrouchFG, sp_playerMaskCrouchBG)
    if (!b_warping)
        slideTimer -= 1
    if (slideTimer <= 0)
    {
        if (!downKey)
        {
            if (!(place_meeting(x, (y - 17), myBlock)))
            {
                spriteFrame = 0
                if b_onGround
                    spriteImage = sp_anton_slideend_stand
                else
                    spriteImage = sp_anton_slidefallend
                spriteFrameSpeed = 0.5
                b_transitioning = 1
                currentState = playerstates.normal
            }
        }
        else if (!(place_meeting(x, (y - 17), myBlock)))
        {
            spriteFrame = 0
            if b_onGround
                spriteImage = sp_anton_slideend
            else
                spriteImage = sp_anton_slidefallend
            spriteFrameSpeed = 0.35
            b_transitioning = 1
            if b_onGround
                currentState = playerstates.crouch
            else
                currentState = playerstates.normal
        }
    }
    if (spriteFacing == 1)
        horizontalSpeed = approach(horizontalSpeed, slideSpeed, 0.25)
    else if (spriteFacing == -1)
        horizontalSpeed = approach(horizontalSpeed, (-slideSpeed), 0.25)
    if (!b_onGround)
    {
        if (coyoteTimeCounter > 0)
            coyoteTimeCounter -= 1
    }
    if (clutchCooldownTimer <= 0 && (!downKey) && (!(place_meeting(x, (y - 17), myBlock))))
    {
        if (jumpKey || jumpBufferCounter > 0)
        {
            if (((!b_jumped) && b_onGround) || coyoteTimeCounter > 0)
            {
                audio_stop_sound(jumpSound)
                audio_play_sound(jumpSound, 1, false)
                jumpBufferCounter = 0
                coyoteTimeCounter = 0
                verticalSpeed = jumpPower
                b_jumped = 1
                audio_stop_sound(sn_antonClutch)
                audio_play_sound_on(playerSoundEmit, sn_antonClutch, false, 1)
				part_type_scale(myClutchDustParticle, spriteFacing, 1)
				part_particles_create(myParticleLayer, xPosition, y, myClutchDustParticle, 1)
                if (spriteFacing == 1)
                    horizontalSpeed = 6
                else if (spriteFacing == -1)
                    horizontalSpeed = -6
                clutchTimer = clutchTimerMax
                slideCooldownTimer = slideCooldownTimerMax
                currentState = playerstates.clutch
            }
        }
        else if attackKey
        {
            audio_stop_sound(sn_antonClutch)
            audio_play_sound(sn_antonClutch, 1, false)
			part_type_scale(myClutchDustParticle, spriteFacing, 1)
			part_particles_create(myParticleLayer, xPosition, y, myClutchDustParticle, 1)
            if (spriteFacing == 1)
                horizontalSpeed = 6
            else if (spriteFacing == -1)
                horizontalSpeed = -6
            clutchTimer = clutchTimerMax
            attackBufferCounter = 0
            slideCooldownTimer = slideCooldownTimerMax
            currentState = playerstates.clutch
        }
    }
    if (currentState != playerstates.slide)
        assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
}

