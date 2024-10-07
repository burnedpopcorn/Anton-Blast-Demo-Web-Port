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
        y -= 1
        if (argument0.myPlayer.currentState == playerstates.airhammer)
            argument0.myPlayer.verticalSpeed = (argument0.myPlayer.jumpPower * 1)
        verticalSpeed = -4
        horizontalSpeed = (5 * _flyDir)
        screenshake(1, 1, 5, 10)
        audio_play_sound(sn_smack, 1, false)
		audio_play_sound_on(enemySoundEmit, sn_pippoDeath, false, 100)
        part_particles_create(global.p_system, x, (y - 8), global.particleHitSmack, 1)
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

if instance_exists(ob_player)
{
    if b_onGround
    {
        if (b_onScreen && ob_player.b_assBlastCollided)
        {
            if (!(place_meeting(x, (y - 1), myBlock)))
            {
                y -= 1
                verticalSpeed = -3
            }
            if (paletteDirection == 1)
            {
                audio_stop_sound(sn_enemyPaletteShift)
                audio_play_sound(sn_enemyPaletteShift, 1, false)
            }
            else if (paletteDirection == -1)
            {
                audio_stop_sound(sn_enemyPaletteShift2)
                audio_play_sound(sn_enemyPaletteShift2, 1, false)
            }
            paletteDirection = (-paletteDirection)
            currentState = enemystates.paletteshift
        }
    }
}
if b_activated
{
    var collidingPlayer = instance_place(x, (y - 1), ob_player)
    var collidingPlayerBelow = instance_place(x, (y + 1), ob_player)
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
                    y -= 1
                    verticalSpeed = -3
                    horizontalSpeed = (2 * sign(collidingPlayer.spriteFacing))
                    audio_sound_pitch(sn_bounce, random_range(0.8, 1.2))
                    audio_play_sound(sn_bounce, 1, false)
                    stunHitTimer = stunHitTimerMax
                    getUpTimer = getUpTimerMax
                    b_canBounce = 0
                    currentState = enemystates.stunned
                }
                break
        }

    }
    var _collidingPlayer = instance_place((x + sign(spriteFacing)), y, ob_player)
    var _collidingPlayerBack = instance_place((x + sign((-spriteFacing))), y, ob_player)
    var _myself = id
    if place_meeting(x, y, ob_explosion)
    {
        part_particles_create(global.p_system, x, (y - 8), global.particleHitSmack, 1)
        if (currentPalette == 1)
            instance_create_depth(x, (y - 8), depth, ob_chipBig)
        else
        {
            for (i = 0; i < 3; i += 1)
                instance_create_depth(x, (y - 8), depth, ob_chip)
        }
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
        currentState = enemystates.death
    }
    switch currentState
    {
        case enemystates.normal:
            if b_onGround
            {
                spriteImage = sp_pippo_walk
                spriteFrameSpeed = 0.2
				if (spriteFrame == 2)
				{
					if (pippostep == 0 && !audio_is_playing(sn_pippoStep1) && !audio_is_playing(sn_pippoStep2))
					{
						audio_play_sound_on(enemySoundEmit, sn_pippoStep1, false, 100)
						pippostep = 1
					}
					if (pippostep == 1 && !audio_is_playing(sn_pippoStep1) && !audio_is_playing(sn_pippoStep2))
					{
						audio_play_sound_on(enemySoundEmit, sn_pippoStep2, false, 100)
						pippostep = 0
					}
				}
                if (!b_bumped)
                    horizontalSpeed = (0.5 * spriteFacing)
                else
                    horizontalSpeed = approach(horizontalSpeed, 0, 0.025)
                if b_bumped
                    bumpTimer -= 1
                if (bumpTimer <= 0)
                    b_bumped = 0
                if (_collidingPlayer != noone)
                {
                    if (_collidingPlayer.myLayer == myLayer && _collidingPlayer.currentState != playerstates.layerjump)
                    {
                        with (_collidingPlayer)
                        {
                            if b_onGround
                            {
                                y -= 1
                                verticalSpeed = -2
                            }
                            if (horizontalSpeed == 0)
                                horizontalSpeed = (5 * sign(_myself.spriteFacing))
                            else
                                horizontalSpeed = (5 * sign((-spriteFacing)))
                            b_jumped = 1
                            coyoteTimeCounter = 0
                        }
                        if (_collidingPlayer.horizontalSpeed == 0)
                        {
                            horizontalSpeed = (5 * _collidingPlayer.horizontalSpeed)
                            bumpTimer = 60
                            b_bumped = 1
                        }
                        audio_stop_sound(sn_pippoBump)
                        audio_play_sound(sn_pippoBump, 1, false)
                        spriteFacing = (-spriteFacing)
                        spriteFrame = 0
                        currentState = enemystates.turn
                    }
                }
            }
            else
            {
                spriteImage = sp_pippo_fall
                spriteFrameSpeed = 0.3
                horizontalSpeed = 0
            }
            if place_meeting((x + sign(spriteFacing)), y, myBlock)
            {
                spriteFacing = (-spriteFacing)
                spriteFrame = 0
                currentState = enemystates.turn
            }
            break
        case enemystates.turn:
            spriteImage = sp_pippo_turn
            spriteFrameSpeed = 0.2
            if b_bumped
                horizontalSpeed = 0
            if (spriteFrame >= 4)
                currentState = enemystates.normal
            break
        case enemystates.stunned:
            spriteImage = sp_pippo_stunned
            spriteFrameSpeed = 0.2
            getUpTimer -= 1
            if (getUpTimer <= 0)
            {
                spriteFrame = 0
                spriteImage = sp_pippo_getUp
                currentState = enemystates.getup
            }
            if b_onGround
                horizontalSpeed = approach(horizontalSpeed, 0, 0.25)
            break
        case enemystates.getup:
            spriteImage = sp_pippo_getUp
            spriteFrameSpeed = 0.25
            if (spriteFrame >= sprite_get_number(sp_pippo_getUp))
            {
                currentState = enemystates.normal
                spriteFrame = 0
                spriteImage = sp_pippo_walk
            }
            break
        case enemystates.paletteshift:
            spriteImage = sp_pippo_fall
            spriteFrameSpeed = 0.5
            horizontalSpeed = 0
            if (currentPalette != paletteDirection)
                currentPalette += (0.1 * sign(paletteDirection))
            if (currentPalette == paletteDirection && b_onGround)
                currentState = enemystates.normal
            break
        case enemystates.death:
            spriteImage = sp_pippo_death
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
