function playerState_AirHammer()
{
    create_player_particle()
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    self.updateHitbox(sp_airHammerHitbox, 2)
	if (b_airHammerFastFall)
		self.updateHitbox(sp_assBlastHitbox, 2)
    if (!b_airHammerVaulted && !b_airHammerRetrigger)
    {
        if (!attackKeyHeld)
            currentState = playerstates.normal
        else
        {
            airHammerTimer = 1000
            airHammerVaultTimer = 1000
        }
    }
    if leftKey
    {
        if (horizontalSpeed > -2.5)
            horizontalSpeed = approach(horizontalSpeed, -2.5, 0.2)
    }
    else if rightKey
    {
        if (horizontalSpeed < 2.5)
            horizontalSpeed = approach(horizontalSpeed, 2.5, 0.2)
    }
    else
        horizontalSpeed = approach(horizontalSpeed, 0, 0.01)
	if (b_airHammerFastFall)
		verticalSpeed = approach(verticalSpeed, airHammerSpeed, airHammerAcceleration)
	else
		verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
	if (attackKey && !b_airHammerRetrigger && b_airHammerVaulted && !b_airHammerFastFall)
	{
		audio_play_sound_on(playerSoundEmit, sn_antonAirHammerRetrigger, false, 100)
		b_airHammerRetrigger = true
		airHammerVaultTimer = 15
	}
	if (downKeyPressed && !b_airHammerFastFall && b_airHammerVaulted)
	{
		audio_play_sound_on(playerSoundEmit, sn_antonAirHammerFastFall, false, 100)
		b_airHammerFastFall = true
	}
	if (b_airHammerRetrigger && airHammerVaultTimer > 0)
		airHammerVaultTimer--
	if (b_onGround && b_airHammerVaulted && b_airHammerFastFall)
	{
        currentState = playerstates.assblast
		audio_stop_sound(sn_antonAirHammerFastFall)
		self.playerAssBlastLand()
	}
    else if ((b_onGround && !b_airHammerFastFall && (airHammerVaultTimer == 0 || (b_airHammerVaulted && !b_airHammerRetrigger))) || airHammerTimer == 0)
    {
        if b_airHammerVaulted
        {
            self.playerLandTransition()
            audio_stop_sound(sn_antonAirHammer)
        }
        airHammerTimer = 0
        airHammerVaultTimer = 0
        b_airHammerVaulted = 0
        part_type_scale(myLandingDustParticle, spriteFacing, 1)
        if b_onGround
            part_particles_create(myParticleLayer, xPosition, y, myLandingDustParticle, 1)
        currentState = playerstates.normal
    }
    else if ((place_meeting(x, (y + 1), myBlock) || place_meeting(x, (y + 1), myPassthrough)) && airHammerVaultTimer > 1 && (!b_airHammerVaulted || b_airHammerRetrigger))
    {
        verticalSpeed = (jumpPower * 1.35)
        audio_play_sound_on(playerSoundEmit, sn_antonHammerSmash, false, 100)
        audio_play_sound_on(playerSoundEmit, sn_antonBoing, false, 100)
        audio_play_sound_on(playerSoundEmit, sn_antonBump, false, 100)
        screenshake(0, 1, 15, 10)
        part_type_scale(global.particleAssBlast2, spriteFacing, 1)
        part_particles_create(myParticleLayer, xPosition, y, myAssBlast2Particle, 1)
        spriteImage = sp_anton_airhammer_vault
        spriteFrame = 0
        spriteFrameSpeed = 0.6
        b_transitioning = 1
        airHammerTimer = -1
        b_airHammerVaulted = 1
		b_airHammerRetrigger = false
    }
}

