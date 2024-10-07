animation_init()
idleTimer = 180
b_idlePlaying = 0
playerSoundEmit = audio_emitter_create()
playerHealth = 4
playerHealthMax = 4
playerPalette = sp_anton_palette
b_onGround = 0
b_jumped = 0
b_touchedGround = 0
b_assBlastCollided = 0
b_airHammerSwung = 0
b_airHammerVaulted = 0
b_airHammerRetrigger = false
b_airHammerFastFall = false
b_carrying = 0
b_fallingCannon = 0
b_canMoveLayerJump = 0
b_squashed = 0
horizontalSpeed = 0
verticalSpeed = 0
maxWalkSpeed = 2.5
gravitySpeed = 0.225
maxFallSpeed = 4
speedMultiplier = 1
horizontalAccelerationBase = 0.22
horizontalAccelerationGround = 0.22
jumpPower = -5
jumpBrakePower = 0.225
climbSpeed = 2
bashSpeed = 5
bashInitialSpeed = 6
bashBoost = 0
bashBoostSpeed = 0.5
slideSpeed = 3
rollSpeed = 4.5
assBlastSpeed = 5
assBlastAcceleration = 0.1
airHammerSpeed = 6.5
airHammerAcceleration = 0.25
airHammerVaultPower = -7
horizontalVelocity = 0
horizontalVelocity_subpixel = 0
verticalVelocity = 0
verticalVelocity_subpixel = 0
coyoteTimeCounter = 0
coyoteTimeMax = 10
jumpBufferCounter = 0
jumpBufferMax = 10
attackBufferCounter = 0
attackBufferMax = 10
slideBufferCounter = 0
slideBufferMax = 10
clutchTimer = 0
clutchTimerMax = 30
clutchCooldownTimer = 0
clutchCooldownTimerMax = 20
slideTimer = 0
slideTimerMax = 30
slideCooldownTimer = 0
slideCooldownTimerMax = 5
assBlastRecoveryTimer = 0
assBlastRecoveryMax = 25
stunTimer = 0
airHammerTimer = 0
airHammerVaultTimer = 0
b_rolling = 0
rollingTimer = 0
rollingTimerMax = 10
b_warping = 0
warpTimer = 0
warpTimerMax = 30
invincibilityTimer = 0
invincibilityTimerMax = 240
invincibilityAlpha = 0
voiceHurtTimer = 0
slopeFactor = 0.85
myLayer = 1
myBlock = ob_block_FG
myPassthrough = ob_passthrough_FG
myLadder = -4
mySlope = ob_slope_FG
mySpring = ob_spring_FG
layerDepth = 1
layerJumpHeight = 25
layerJumpX = -1
layerJumpY = -1
layerJumpVerticalSpeed = 0
layerJumpGrav = 0
layerJumpTime = 50
layerJumpTimer = -1
layerJumpMaxHorizontalSpeed = 1
spriteAlpha = 1
spriteFacing = 1
spriteImage = sp_playerMaskFG
spriteFrame = 0
spriteRotation = 0
spriteScale = 1
spriteColor = c_white
playerTrails = 0
b_transitionParticle = 0
b_virtualController = 0
jumpSound = sn_antonJump
currentState = playerstates.dummy
myHitbox = instance_create_depth(x, y, depth, ob_playerHitbox)
myHitbox.myPlayer = id
updateHitbox = function(argument0, argument1)
{
    if (argument0 == undefined)
        argument0 = -1
    if (argument1 == undefined)
        argument1 = 0
    with (myHitbox)
    {
        sprite_index = argument0
        strength = argument1
        event_perform(ev_step, ev_step_end)
    }
}

playerClutchHit = function()
{
    if (currentState == playerstates.slide)
        currentState = playerstates.crouch
	else if (currentState == playerstates.airhammer)
	{
		verticalSpeed = (jumpPower * 1)
		audio_play_sound_on(playerSoundEmit, sn_antonBoing, false, 100)
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
    else
    {
        if (!b_onGround)
        {
            horizontalSpeed = (2 * (-sign(horizontalSpeed)))
            verticalSpeed = 0
        }
        else
        {
            y -= 1
            horizontalSpeed = (2 * (-sign(horizontalSpeed)))
            verticalSpeed = -1.8
        }
        stunTimer = 15
        if (currentState == playerstates.assblast)
            self.playerAssBlastLand()
        else
            currentState = playerstates.clutchhit
    }
    spriteFrame = 0
    audio_stop_sound(sn_antonBump)
    audio_play_sound_on(playerSoundEmit, sn_antonBump, false, 100)
    audio_play_sound_on(playerSoundEmit, sn_antonHammerSmash, false, 100)
    screenshake(1, 0, 15, 15)
}

playerAssBlastLand = function()
{
    horizontalSpeed = 0
    verticalSpeed = -3
    audio_play_sound_on(playerSoundEmit, sn_antonBump, false, 100)
    audio_play_sound_on(playerSoundEmit, sn_antonAssBlastHit, false, 100)
    audio_stop_sound(sn_antonAssBlast)
    assBlastRecoveryTimer = assBlastRecoveryMax
    screenshake(0, 1, 15, 15)
    spriteFrame = 0
    part_type_scale(myAssBlastParticle, spriteFacing, 1)
    part_particles_create(myParticleLayer, xPosition, y, myAssBlastParticle, 1)
    b_assBlastCollided = 1
}

playerGetHurt = function()
{
    if (invincibilityTimer == 0 && currentState != playerstates.dummy)
    {
        if (playerHealth > 1)
        {
            if (!b_onGround)
            {
                horizontalSpeed = (2 * (-sign(horizontalSpeed)))
                verticalSpeed = 0
            }
            else
            {
                y -= 1
                if (horizontalSpeed != 0)
                    horizontalSpeed = (2 * (-sign(horizontalSpeed)))
                else
                    horizontalSpeed = (2 * (-spriteFacing))
                verticalSpeed = -4
            }
            spriteImage = sp_anton_hurt
            spriteFrame = 0
            spriteFrameSpeed = 0.35
            b_transitioning = 1
            ob_healthCounter.spriteAlphaTimer = 300
            playerHealth -= 1
            voiceHurtTimer = 5
            currentState = playerstates.hurt
            invincibilityTimer = invincibilityTimerMax
            stunTimer = 5
            audio_play_sound(sn_antonHurt, 1, false)
        }
        else
        {
            with (ob_runbackManager)
            {
                if b_runbackStarted
                    self.runbackStop()
            }
            instance_create_depth(xPosition, y, -10000, ob_antonDied)
            currentState = playerstates.death
            playerHealth = 0
        }
    }
}

setLayerJumpX = function()
{
    if (myLayer == 1)
        layerJumpX = round((x + (camera_get_view_x(view_camera[0]) * 0.5)))
    else
        layerJumpX = round((x - (camera_get_view_x(view_camera[0]) * 0.5)))
}

layerJump = function(argument0, argument1)
{
    myLayer = (myLayer == 1 ? 2 : 1)
    currentState = playerstates.layerjump
    horizontalSpeed = 0
    verticalSpeed = 0
    horizontalVelocity_subpixel = 0
    verticalVelocity_subpixel = 0
    audio_stop_sound(sn_antonLayerJump)
    audio_play_sound_on(playerSoundEmit, sn_antonLayerJump, false, 100)
    assign_layer_objects()
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    self.setLayerJumpX()
    var _startY = y
    x = argument0
    while (place_meeting(x, argument1, myBlock) || place_meeting(x, argument1, myPassthrough))
    {
        argument1 -= 1
        if (argument1 < 0)
            argument1 = y
    }
    y = argument1
    while (!((check_below(argument1) || check_below_passthrough(argument1))))
    {
        argument1 += 1
        if (argument1 > room_height)
            argument1 = y
    }
    y = argument1
    var _layerJumpHighPoint = (min(_startY, y) - layerJumpHeight)
    var _fallDistance = (y - _layerJumpHighPoint)
    var _jumpDistance = (_startY - _layerJumpHighPoint)
    layerJumpGrav = 0
    for (var _currentJumpTime = 999; _currentJumpTime > layerJumpTime; _currentJumpTime = (_timeToApex + sqrt(((2 * _fallDistance) / layerJumpGrav))))
    {
        layerJumpGrav += 0.01
        var _timeToApex = sqrt(((2 * _jumpDistance) / layerJumpGrav))
        layerJumpVerticalSpeed = ((-layerJumpGrav) * _timeToApex)
    }
    layerJumpY = _startY
    layerJumpTimer = 0
}

playerLandTransition = function()
{
    spriteFrame = 0
    spriteFrameSpeed = 0.35
    b_transitioning = 1
    part_type_scale(myLandingDustParticle, spriteFacing, 1)
    part_particles_create(myParticleLayer, xPosition, y, myLandingDustParticle, 1)
    spriteImage = sp_anton_jump_land
}

with (instance_create(ob_playerSilhouette))
    myPlayer = other.id
