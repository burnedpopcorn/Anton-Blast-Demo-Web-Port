function animation_control_Anton()
{
    var frameNumber = floor(spriteFrame)
    switch currentState
    {
        case playerstates.normal:
            if (b_onGround && (!b_transitioning))
            {
                if (horizontalVelocity == 0)
                {
                    if (!b_idlePlaying)
                    {
                        spriteFrameSpeed = 0.33
                        idleTimer -= 1
                        spriteImage = sp_anton_idle
                        if (idleTimer <= 0)
                        {
                            spriteFrame = 0
                            b_idlePlaying = 1
                        }
                    }
                    else if b_idlePlaying
                    {
                        idleTimer = 0
                        spriteFrameSpeed = 0.4
                        spriteImage = sp_anton_idle_glare
                        if (spriteFrame >= 37 || leftKey || rightKey || jumpKey)
                        {
                            idleTimer = irandom_range(200, 400)
                            b_idlePlaying = 0
                        }
                    }
                }
                else
                {
                    b_idlePlaying = 0
                    if (spriteImage != sp_anton_run)
                    {
                        spriteFrame = 0
                        spriteImage = sp_anton_run
                    }
                    spriteFrameSpeed = 0.4
                    if (frameNumber == 5 || frameNumber == 11)
                    {
                        if (!audio_is_playing(sn_antonFootstep))
                        {
                            part_type_scale(myFootDustParticle, spriteFacing, 1)
                            part_particles_create(myParticleLayer, xPosition, y, myFootDustParticle, 1)
                            audio_play_sound_on(playerSoundEmit, choose(sn_antonStep1, sn_antonStep2, sn_antonStep3), false, 1)
                            audio_sound_pitch(sn_antonFootstep, random_range(0.9, 1.1))
                            audio_play_sound_on(playerSoundEmit, sn_antonFootstep, false, 1)
                        }
                    }
                }
            }
            if b_onGround
            {
                if (spriteImage == sp_anton_sproutpull)
                {
                    if (frameNumber == 5 && (!b_transitionParticle))
                    {
                        part_type_scale(myLandingDustParticle, spriteFacing, 1)
                        part_particles_create(myParticleLayer, xPosition, y, myLandingDustParticle, 1)
                        b_transitionParticle = 1
                    }
                }
            }
            else if b_jumped
            {
                if (spriteImage != sp_anton_jump_loop)
                {
                    spriteFrameSpeed = 0.6
                    spriteImage = sp_anton_jump
                    if (spriteImage == sp_anton_jump && frameNumber == (sprite_get_number(sp_anton_jump) - 1))
                    {
                        spriteFrameSpeed = 0.4
                        spriteImage = sp_anton_jump_loop
                    }
                }
            }
            else
            {
                spriteFrameSpeed = 0.4
                spriteImage = sp_anton_jump_loop
            }
            break
        case playerstates.clutch:
            spriteFrameSpeed = 0.5
            if b_onGround
            {
                spriteImage = sp_anton_clutch
                if (frameNumber == 0 || frameNumber == 3 || frameNumber == 5)
                {
                    if (!b_transitionParticle)
                    {
                        part_type_scale(myFootDustParticle, spriteFacing, 1)
                        part_particles_create(myParticleLayer, xPosition, y, myFootDustParticle, 1)
						audio_play_sound_on(playerSoundEmit, sn_antonClutchStep, false, 1)
                        audio_sound_pitch(sn_antonFootstep, random_range(0.9, 1.1))
                        audio_play_sound_on(playerSoundEmit, sn_antonFootstep, false, 1)
                        b_transitionParticle = 1
                    }
                }
            }
            else
			{
				if (spriteImage == sp_anton_clutch_jump && frameNumber == (sprite_get_number(sp_anton_clutch_jump) - 1))
					spriteImage = sp_anton_clutch_air
				if (spriteImage != sp_anton_clutch_jump)
					spriteImage = sp_anton_clutch_air
			}
            break
        case playerstates.crouch:
            if (!b_transitioning)
            {
                if b_onGround
                {
                    if ((!leftKey) && (!rightKey) && horizontalSpeed == 0)
                        spriteImage = sp_anton_crouch
                    else if (leftKey || rightKey)
                    {
                        spriteFrameSpeed = 0.2
                        if (spriteFacing == 1)
                        {
                            if leftKey
                                spriteImage = sp_anton_crawl_bw
                            else if rightKey
                                spriteImage = sp_anton_crawl
                        }
                        else if (spriteFacing == -1)
                        {
                            if leftKey
                                spriteImage = sp_anton_crawl
                            else if rightKey
                                spriteImage = sp_anton_crawl_bw
                        }
                        if (frameNumber == 2)
                        {
                            if (!audio_is_playing(sn_antonCrawl2))
                                audio_play_sound(sn_antonCrawl2, 1, false)
                        }
                        if (frameNumber == 6)
                        {
                            if (!audio_is_playing(sn_antonCrawl))
                                audio_play_sound(sn_antonCrawl, 1, false)
                        }
                    }
                }
                else if (!b_onGround)
                {
                    spriteFrameSpeed = 0.4
                    spriteImage = sp_anton_crouchjump_loop
                }
            }
            break
        case playerstates.clutchhit:
            spriteImage = sp_anton_clutch_hit
            spriteFrameSpeed = 1
            break
        case playerstates.slide:
            if (!b_transitioning)
            {
                if b_onGround
                    spriteImage = sp_anton_slide
                else
                    spriteImage = sp_anton_slidefall
                spriteFrameSpeed = 0.5
            }
            break
        case playerstates.layerjump:
            if (myLayer == 1)
                spriteImage = sp_anton_layerjump_fg
            else if (myLayer == 2)
                spriteImage = sp_anton_layerjump_bg
            break
        case playerstates.airhammer:
            if (!b_transitioning)
            {
                spriteImage = sp_anton_airhammer
                spriteFrameSpeed = 0.9
                if (frameNumber == 1)
                {
                    audio_stop_sound(sn_antonAirHammer)
                    audio_play_sound_on(playerSoundEmit, sn_antonAirHammer, false, 100)
                }
            }
            break
        case playerstates.assblast:
            if (!b_transitioning)
            {
                if b_assBlastCollided
                {
                    if (frameNumber == 5)
                        spriteFrameSpeed = 0
                    else
                        spriteFrameSpeed = 0.25
                    spriteImage = sp_anton_assblast_land
                }
                else if (!b_assBlastCollided)
                {
                    spriteFrameSpeed = 0.25
                    spriteImage = sp_anton_assblast_loop
                }
            }
            break
        case playerstates.roll:
            if (!b_transitioning)
            {
                spriteFrameSpeed = 0.5
                spriteImage = sp_anton_ball
            }
            break
        case playerstates.ladderclimb:
            if (verticalVelocity > 0)
            {
                spriteFrameSpeed = 0.33
                spriteImage = sp_anton_ladderdown
            }
            else if (verticalVelocity < 0)
            {
                if (frameNumber == 2)
                {
                    if (!audio_is_playing(sn_antonCrawl2))
                        audio_play_sound(sn_antonCrawl2, 1, false)
                }
                if (frameNumber == 4)
                {
                    if (!audio_is_playing(sn_antonCrawl))
                        audio_play_sound(sn_antonCrawl, 1, false)
                }
                spriteFrameSpeed = 0.3
                spriteImage = sp_anton_ladderclimb
            }
            else
            {
                spriteImage = sp_anton_ladderidle
                spriteFrameSpeed = 0
            }
            break
        case playerstates.hurt:
            if (!b_transitioning)
            {
                spriteFrameSpeed = 0.33
                spriteImage = sp_anton_hurt_loop
            }
            break
        case playerstates.rollhit:
            if (!b_transitioning)
                spriteImage = sp_anton_ball_stun
            break
        case playerstates.reactcannon:
            spriteFrameSpeed = 0
            break
    }

}

