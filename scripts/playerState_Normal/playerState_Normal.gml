function playerState_Normal()
{
    self.updateHitbox()
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    if (myLayer == 1)
        var creviceHeight = 17
    else if (myLayer == 2)
        creviceHeight = 9
    if (clutchCooldownTimer > 0)
        clutchCooldownTimer -= 1
    b_assBlastCollided = 0
    b_airHammerVaulted = 0
	b_airHammerFastFall = false
	b_airHammerRetrigger = false
    if leftKey
    {
        horizontalSpeed = approach(horizontalSpeed, (-maxWalkSpeed), horizontalAccelerationGround)
        if (b_onGround && spriteFacing == 1)
        {
            spriteImage = sp_anton_turn
            spriteFacing = -1
            spriteFrame = 0
            spriteFrameSpeed = 0.5
            b_transitioning = 1
        }
    }
    else if rightKey
    {
        horizontalSpeed = approach(horizontalSpeed, maxWalkSpeed, horizontalAccelerationGround)
        if (b_onGround && spriteFacing == -1)
        {
            spriteImage = sp_anton_turn
            spriteFacing = 1
            spriteFrame = 0
            spriteFrameSpeed = 0.5
            b_transitioning = 1
        }
    }
    else
        horizontalSpeed = approach(horizontalSpeed, 0, horizontalAccelerationGround)
    if (!b_onGround)
    {
        if (verticalSpeed < 0 && (!jumpKeyHeld))
            verticalSpeed *= 0.9
        if (coyoteTimeCounter > 0)
            coyoteTimeCounter -= 1
    }
    else if b_onGround
        b_airHammerSwung = 0
    if (jumpKey || jumpBufferCounter > 0)
    {
        if (((!b_jumped) && b_onGround) || coyoteTimeCounter > 0)
        {
            jumpBufferCounter = 0
            coyoteTimeCounter = 0
            spriteFrame = 0
            b_jumped = 1
            var _spring = instance_place(x, (y + 1), mySpring)
            if ((!leftKey) && (!rightKey) && upKey && _spring != noone && _spring.b_springCanUse)
            {
                self.layerJump(_spring.targetX, _spring.targetY)
                b_canMoveLayerJump = _spring.b_canSteer
                _spring.sprite_index = _spring.launchSprite
                return;
            }
            else
            {
                spriteFrameSpeed = 0.6
                spriteImage = sp_anton_jump
                audio_stop_sound(jumpSound)
                audio_play_sound_on(playerSoundEmit, jumpSound, false, 100)
                verticalSpeed = jumpPower
            }
        }
    }
    if (horizontalSpeed > 2.5)
        horizontalSpeed = approach(horizontalSpeed, 2.5, 0.1)
    else if (horizontalSpeed < -2.5)
        horizontalSpeed = approach(horizontalSpeed, -2.5, 0.1)
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    if (attackKey || attackBufferCounter > 0)
    {
        attackBufferCounter = 0
        var _sprout = instance_place(x, y, mySprout)
        if (_sprout != noone)
        {
            b_transitioning = 1
            spriteFrame = 0
            spriteFrameSpeed = 0.33
            spriteImage = sp_anton_sproutpull
            _sprout.pullUp()
        }
        else if (b_onGround && (clutchCooldownTimer == 0 || spriteImage == sp_anton_clutch_skid))
        {
            audio_stop_sound(sn_antonClutch)
            audio_play_sound_on(playerSoundEmit, sn_antonClutch, false, 100)
			part_type_scale(myClutchDustParticle, spriteFacing, 1)
			part_particles_create(myParticleLayer, xPosition, y, myClutchDustParticle, 1)
            horizontalSpeed = (bashInitialSpeed * spriteFacing)
            playerTrails = 0
            clutchTimer = clutchTimerMax
            slideCooldownTimer = slideCooldownTimerMax
            attackBufferCounter = 0
            currentState = playerstates.clutch
        }
        else if ((!b_onGround) && (!b_airHammerSwung))
        {
            spriteFrame = 0
            spriteImage = sp_anton_airhammer_transition
            spriteFrameSpeed = 0.75
            b_transitioning = 1
            airHammerVaultTimer = 25
            airHammerTimer = 25
            playerTrails = 0
            b_airHammerSwung = 1
            attackBufferCounter = 0
            currentState = playerstates.airhammer
        }
    }
    if (slideKey && b_onGround && slideCooldownTimer <= 0)
    {
        slideTimer = slideTimerMax
        clutchCooldownTimer = (clutchCooldownTimerMax * 0.5)
        clutchTimer = 0
        attackBufferCounter = 0
        audio_stop_sound(sn_antonSlide)
        audio_play_sound_on(playerSoundEmit, sn_antonSlide, false, 100)
        if (spriteFacing == 1)
            horizontalSpeed = bashSpeed
        else if (spriteFacing == -1)
            horizontalSpeed = (-bashSpeed)
        spriteFrame = 0
        spriteImage = sp_anton_slidestart
        spriteFrameSpeed = 0.5
        b_transitioning = 1
        slideBufferCounter = 0
        currentState = playerstates.slide
        return;
    }
    if downKeyPressed
    {
        if (!b_onGround)
        {
            spriteFrame = 0
            spriteImage = sp_anton_assblast
            spriteFrameSpeed = 0.5
            b_transitioning = 1
            currentState = playerstates.assblast
        }
        else if b_onGround
        {
            spriteFrame = 0
            spriteImage = sp_anton_crouch_start
            spriteFrameSpeed = 0.33
            b_transitioning = 1
            currentState = playerstates.crouch
        }
    }
    if downKeyPressed
    {
        var _rollSlope = instance_place(x, (y + 1), mySlope)
        if (_rollSlope != noone && string_count("45", object_get_name(_rollSlope.object_index)) > 0)
        {
            spriteFrame = 0
            spriteImage = sp_anton_ball_start
            spriteFrameSpeed = 0.25
            b_transitioning = 1
            currentState = playerstates.roll
            spriteFacing = _rollSlope.getDirection()
        }
    }
    if ((upKey && collision_rectangle((x - 1), bbox_top, (x + 1), (bbox_bottom - 1), myLadder, 0, 0)) || (downKey && b_onGround && collision_rectangle((x - 1), (bbox_top - 1), (x + 1), (bbox_bottom + 1), myLadder, 0, 0) && (!(place_meeting(x, (y + 1), myBlock)))))
    {
        verticalSpeed = 0
        horizontalSpeed = 0
        y -= 1
        currentState = playerstates.ladderclimb
    }
}

