event_inherited()
onHitboxCollision = function(argument0)
{
    if (currentState != enemystates.death)
    {
        var _flyDir = 1
        if (bbox_left < ob_player.bbox_left)
            _flyDir = -1
        if (!((currentState == enemystates.stunned || argument0.myPlayer.currentState == playerstates.roll || argument0.myPlayer.currentState == playerstates.airhammer)))
            argument0.myPlayer.playerClutchHit()
        if (argument0.myPlayer.currentState == playerstates.airhammer)
            argument0.myPlayer.verticalSpeed = (argument0.myPlayer.jumpPower * 1)
        y -= 1
        verticalSpeed = -4
        horizontalSpeed = (5 * _flyDir)
        screenshake(1, 1, 5, 10)
        audio_play_sound(sn_smack, 1, false)
		audio_play_sound_on(enemySoundEmit, sn_ballbusterScream, false, 100)
        part_particles_create(global.p_system, xPosition, (y - 8), global.particleHitSmack, 1)
		if (myLayer == 2)
		{
			for (var i = 0; i < 3; i += 1)
				instance_create_depth(x, (y - 8), depth, ob_chip_bg)
		}
		else
		{
	        if (currentPalette == 1)
	            instance_create_depth(x, (y - 8), depth, ob_chipBig)
	        else
	        {
	            for (var i = 0; i < 3; i += 1)
					instance_create_depth(x, (y - 8), depth, ob_chip)
	        }
		}
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
        currentState = enemystates.death
    }
}

if b_activated
{
    var collidingPlayer = instance_place(x, (y - 1), ob_player)
    if (collidingPlayer != noone)
    {
        switch collidingPlayer.currentState
        {
            case playerstates.layerjump:
            case playerstates.assblast:
                break
            default:
                if (collidingPlayer.myLayer == myLayer && collidingPlayer.verticalSpeed > 0 && stunHitTimer == 0 && b_canBounce)
                {
                    with (collidingPlayer)
                    {
                        verticalSpeed = (jumpPower * 1)
                        if (horizontalSpeed == 0)
                            horizontalSpeed = ((-spriteFacing) * 2)
                        spriteImage = sp_anton_jump
                    }
                    horizontalSpeed = (2 * sign(collidingPlayer.spriteFacing))
                    self.ballbusterStun()
                }
                break
        }

    }
    var _playerInSight = collision_rectangle(x, (y - 16), (x + (128 * sign(spriteFacing))), y, ob_player, 0, 0)
    switch currentState
    {
        case enemystates.normal:
            with (myHitbox)
                sprite_index = sp_ballbuster_hurtbox_idle
            if b_onGround
            {
                spriteImage = sp_ballbuster_walk
                spriteFrameSpeed = 0.2
                horizontalSpeed = (0.5 * spriteFacing)
                if (_playerInSight != noone)
                {
                    if (_playerInSight.myLayer == myLayer && _playerInSight.currentState != playerstates.layerjump)
                    {
                        spriteFrame = 0
                        windupTimer = windupTimerMax
                        currentState = enemystates.revup
                    }
                }
            }
            else
            {
                spriteImage = sp_ballbuster_fall
                spriteFrameSpeed = 0.2
                horizontalSpeed = 0
            }
            if place_meeting((x + sign(spriteFacing)), y, myBlock)
            {
                spriteFacing = (-spriteFacing)
                spriteImage = sp_ballbuster_turn
                spriteFrame = 0
                currentState = enemystates.turn
            }
            break
        case enemystates.turn:
            with (myHitbox)
                sprite_index = sp_ballbuster_hurtbox_idle
            spriteImage = sp_ballbuster_turn
            spriteFrameSpeed = 0.2
            horizontalSpeed = (0.25 * spriteFacing)
            if (spriteFrame >= 3)
            {
                spriteFrame = 3
                currentState = enemystates.normal
                spriteFrame = 0
            }
            break
        case enemystates.revup:
            with (myHitbox)
                sprite_index = sp_ballbuster_hurtbox_charge
            horizontalSpeed = 0
            if (spriteFrame == 2 && (!b_spawnedParticle))
            {
                audio_play_sound_on(enemySoundEmit, sn_ballbusterPrep, false, 100)
                part_type_scale(global.particleFootDust, spriteFacing, 1)
                part_particles_create(myParticleLayer, (xPosition - (8 * spriteFacing)), y, global.particleFootDust, 1)
                b_spawnedParticle = 1
            }
            if (spriteFrame != 2)
                b_spawnedParticle = 0
            spriteImage = sp_ballbuster_chargeStart
            spriteFrameSpeed = 0.2
            windupTimer -= 1
            if (windupTimer == 0)
            {
                audio_play_sound_on(enemySoundEmit, sn_antonRollStart, false, 100)
				spriteImage = sp_ballbuster_chargeLoopStart
                currentState = enemystates.charge
            }
            break
        case enemystates.charge:
            with (myHitbox)
                sprite_index = sp_ballbuster_hurtbox_charge
			if (spriteImage == sp_ballbuster_chargeLoopStart)
			{
				if (spriteFrame == sprite_get_number(sp_ballbuster_chargeLoopStart) - 1)
					spriteImage = sp_ballbuster_chargeLoop
			}
			else
				spriteImage = sp_ballbuster_chargeLoop
            spriteFrameSpeed = 0.25
            horizontalSpeed = approach(horizontalSpeed, (4 * sign(spriteFacing)), 0.5)
            if place_meeting((x + sign(horizontalSpeed)), y, myBlock)
            {
                horizontalSpeed = (2 * sign((-spriteFacing)))
                spriteImage = sp_ballbuster_stunStart
                screenshake(1, 0, 5, 10)
                self.ballbusterStun()
            }
            break
        case enemystates.stunned:
            with (myHitbox)
                sprite_index = sp_empty
            if (spriteImage == sp_ballbuster_stunStart)
            {
                spriteFrameSpeed = 0.3
                if (spriteFrame >= sprite_get_number(sp_ballbuster_stunStart))
                    spriteImage = sp_ballbuster_stunned
            }
            else
                spriteImage = sp_ballbuster_stunned
            spriteFrameSpeed = 0.2
            getUpTimer -= 1
            if place_meeting((x + spriteFacing), y, myBlock)
                horizontalSpeed = (2 * (-spriteFacing))
            if (getUpTimer <= 0)
            {
                spriteImage = sp_ballbuster_stunGetUp
                spriteFrame = 0
                currentState = enemystates.getup
            }
            if b_onGround
                horizontalSpeed = approach(horizontalSpeed, 0, 0.5)
            break
        case enemystates.getup:
            with (myHitbox)
                sprite_index = sp_empty
            spriteImage = sp_ballbuster_stunGetUp
            spriteFrameSpeed = 0.23
            if (spriteFrame == 8 && (!audio_is_playing(sn_antonLandGround)))
                audio_play_sound_on(enemySoundEmit, sn_antonLandGround, false, 100)
            if (spriteFrame == 14 && (!audio_is_playing(sn_ballbusterPrep)))
                audio_play_sound_on(enemySoundEmit, sn_ballbusterPrep, false, 100)
            if (spriteFrame >= sprite_get_number(sp_ballbuster_stunGetUp))
            {
                spriteFrame = 0
                spriteFacing = (-spriteFacing)
                spriteImage = sp_ballbuster_walk
                currentState = enemystates.normal
            }
            break
        case enemystates.death:
            with (myHitbox)
                sprite_index = sp_empty
            spriteImage = sp_ballbuster_death
            if ((b_onGround || place_meeting((x + horizontalSpeed), y, myBlock)) && (!b_bounced))
            {
                y -= 1
				if (myLayer == 2)
					instance_create_depth(xPosition, (y - 8), depth, ob_explosion_BG)
				else
					instance_create_depth(x, (y - 8), depth, ob_explosion)
                screenshake(x, y, 20, 10)
                audio_stop_sound(sn_explosiveCrate)
                audio_sound_pitch(sn_explosiveCrate, random_range(0.8, 1.2))
                audio_play_sound(sn_explosiveCrate, 1, false)
                instance_destroy()
            }
            if b_bounced
                spriteRotation += (6 * sign(horizontalSpeed))
            break
    }

}
