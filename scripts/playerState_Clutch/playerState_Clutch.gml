function playerState_Clutch()
{
    self.updateHitbox(sp_clutchHitbox, 2)
    if (currentState != playerstates.clutch)
        return;
	if instance_exists(ob_boostCounter)
	{
	    ob_boostCounter.spriteAlphaTimer = 240
	    ob_boostCounter.spriteAlpha = 1
	}
	if (!b_squashed)
		create_player_particle(8)
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    if (!b_warping)
        clutchTimer -= 1
    if (clutchTimer <= 0 && b_onGround && !attackKeyHeld)
    {
        currentState = playerstates.normal
        return;
    }
    if ((clutchTimerMax - clutchTimer) < 2)
        horizontalSpeed = ((bashInitialSpeed + (bashBoostSpeed * bashBoost)) * spriteFacing)
    else
        horizontalSpeed = approach(horizontalSpeed, ((bashSpeed + (bashBoostSpeed * bashBoost)) * spriteFacing), 0.2)
    if (!b_onGround)
    {
        if (verticalSpeed < 0 && (!jumpKeyHeld))
            verticalSpeed *= 0.9
        if (coyoteTimeCounter > 0)
            coyoteTimeCounter -= 1
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
            audio_stop_sound(jumpSound)
            audio_play_sound(jumpSound, 1, false)
            jumpBufferCounter = 0
            coyoteTimeCounter = 0
            verticalSpeed = jumpPower
            b_jumped = 1
        }
    }
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    if ((spriteFacing == 1 && leftKey) || (spriteFacing == -1 && rightKey))
    {
        if b_onGround
        {
            audio_stop_sound(sn_antonSkid)
            audio_play_sound_on(playerSoundEmit, sn_antonSkid, false, 100)
            spriteFrame = 0
            spriteImage = sp_anton_clutch_skid
            b_transitioning = 1
            spriteFacing *= -1
        }
        clutchCooldownTimer = clutchCooldownTimerMax
        currentState = playerstates.normal
        return;
    }
    if (downKeyPressed || slideBufferCounter > 0)
    {
        var _rollSlope = instance_place(x, (y + 1), mySlope)
        if ((b_onGround && slideCooldownTimer <= 0 && _rollSlope == noone) || (_rollSlope != noone && string_count("45", object_get_name(_rollSlope.object_index)) == 0))
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
        else if (b_onGround && _rollSlope != noone && string_count("45", object_get_name(_rollSlope.object_index)) > 0)
        {
            spriteFrame = 0
            spriteImage = sp_anton_ball_start
            spriteFrameSpeed = 0.25
            b_transitioning = 1
            slideBufferCounter = 0
            currentState = playerstates.roll
            spriteFacing = _rollSlope.getDirection()
        }
    }
    else if (downKeyPressed && (!b_onGround))
    {
        spriteFrame = 0
        spriteImage = sp_anton_assblast
        spriteFrameSpeed = 0.5
        b_transitioning = 1
        currentState = playerstates.assblast
        return;
    }
    var _collidingBlock = instance_place((x + sign(horizontalSpeed)), (y - (b_onGround && (!b_squashed))), myBlock)
    if (_collidingBlock != noone && (!(place_meeting(x, (y + 1), mySlope))))
    {
        if _collidingBlock.destructible
            _collidingBlock.onHitboxCollision(myHitbox)
        else
            self.playerClutchHit()
        return;
    }
	if (attackKey && clutchTimer < 15 && clutchTimer > 0)
	{
		audio_stop_sound(sn_antonClutch)
        audio_play_sound_on(playerSoundEmit, sn_antonClutch, false, 100)
        clutchTimer = clutchTimerMax
		bashBoost++
		part_type_scale(myFootDustParticle, spriteFacing, 1)
        part_particles_create(myParticleLayer, xPosition, y, myFootDustParticle, 1)
		part_type_scale(myClutchDustParticle, spriteFacing, 1)
		part_particles_create(myParticleLayer, xPosition, y, myClutchDustParticle, 1)
		if instance_exists(ob_boostCounter)
	    {
	        ob_boostCounter.spriteAlphaTimer = 240
	        ob_boostCounter.spriteScale += 0.5
	        ob_boostCounter.spriteAlpha = 1
	    }
	}
    if ((!b_onGround) && b_jumped && attackKey)
    {
        airHammerVaultTimer = 25
        airHammerTimer = 25
        playerTrails = 0
        attackBufferCounter = 0
        currentState = playerstates.airhammer
    }
}

