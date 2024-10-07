var _temp_local_var_5;
animation_frame_counter()
audio_emitter_position(playerSoundEmit, xPosition, y, 0)
audio_emitter_gain(playerSoundEmit, 1)
player_input(ob_globalMenuInput.lastDevice)
assign_layer_objects()
assign_layer_particles()
if (currentState != playerstates.hurt)
{
    if (invincibilityTimer != 0)
    {
        if (spriteAlpha == 1)
            spriteAlpha = 0.5
        else if (spriteAlpha == 0.5)
            spriteAlpha = 1
        invincibilityTimer -= 1
    }
    else
    {
        invincibilityTimer = 0
        if (currentState != playerstates.dummy)
            spriteAlpha = 1
    }
}
if (currentState != playerstates.normal)
    b_idlePlaying = 0
with (instance_place((x + horizontalSpeed), (y + verticalSpeed), myExplosiveCrate))
    self.destructibleDestroy()
if place_meeting(x, y, myHurtyExplosion)
    self.playerGetHurt()
if b_onGround
{
    if (!b_touchedGround)
    {
        if (currentState == playerstates.normal || currentState == playerstates.clutch)
            self.playerLandTransition()
        else if (currentState == playerstates.crouch)
        {
            spriteFrame = 0
            spriteFrameSpeed = 0.33
            b_transitioning = 1
            spriteImage = sp_anton_crouchjump_land
        }
        audio_stop_sound(sn_antonLandGround)
        audio_play_sound_on(playerSoundEmit, sn_antonLandGround, false, 1)
        b_touchedGround = 1
    }
    coyoteTimeCounter = coyoteTimeMax
}
else
    b_touchedGround = 0
if (currentState != playerstates.roll)
    audio_stop_sound(sn_antonRoll)
if (currentState != playerstates.airhammer)
	audio_stop_sound(sn_antonAirHammerFastFall)
if jumpKey
    jumpBufferCounter = jumpBufferMax
if (jumpBufferCounter > 0)
    jumpBufferCounter -= 1
if attackKey
    attackBufferCounter = attackBufferMax
countdown(attackBufferCounter)
if (attackBufferCounter > 0)
    attackBufferCounter -= 1
if downKey
    slideBufferCounter = slideBufferMax
if slideKey
	slideBufferCounter = slideBufferMax
if (slideBufferCounter > 0)
    slideBufferCounter -= 1
if (slideCooldownTimer > 0)
    slideCooldownTimer -= 1
if b_warping
{
    warpTimer -= 1
    if (warpTimer <= 0)
        b_warping = 0
}
switch currentState
{
    case playerstates.normal:
        playerState_Normal()
        break
    case playerstates.clutch:
        playerState_Clutch()
        break
    case playerstates.airhammer:
        playerState_AirHammer()
        break
    case playerstates.crouch:
        playerState_Crouch()
        break
    case playerstates.slide:
        playerState_Slide()
        break
    case playerstates.roll:
        playerState_Roll()
        break
    case playerstates.assblast:
        playerState_AssBlast()
        break
    case playerstates.ladderclimb:
        playerState_LadderClimb()
        break
    case playerstates.clutchhit:
        playerState_ClutchHit()
        break
    case playerstates.rollhit:
        playerState_RollHit()
        break
    case playerstates.hurt:
        playerState_Hurt()
        break
    case playerstates.layerjump:
        playerState_LayerJump()
        break
    case playerstates.dummy:
        playerState_Dummy()
        break
    case playerstates.death:
        playerState_Death()
        break
    case playerstates.reactcannon:
        playerState_ReactCannon()
        break
}

if (currentState != playerstates.assblast)
    audio_stop_sound(sn_antonAssBlast)
if (currentState != playerstates.clutch)
	bashBoost = 0
speedMultiplier = 1
if b_squashed
    speedMultiplier = 0.5
if b_onGround
{
    var _collidingSlope = instance_place(x, (y + 1), mySlope)
    if (_collidingSlope != noone)
    {
        var _slopeName = object_get_name(_collidingSlope.object_index)
        if (string_count("45", _slopeName) > 0)
            speedMultiplier = 0.75
        else
            speedMultiplier = 1
    }
}
horizontalSpeed *= speedMultiplier
currentX = x
currentY = y
xPosition = (currentX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))
speed_subpixel()
if (currentState == playerstates.layerjump)
    depth = (layer_get_depth("InstancesBG") - 50)
spriteScale = (myLayer == 1 ? 1 : 0.5)
repeat (abs(verticalVelocity))
{
    if (!((place_meeting(x, (y + sign(verticalVelocity)), myBlock) || (verticalVelocity > 0 && (check_below() || check_below_passthrough())))))
        y += sign(verticalVelocity)
    else
    {
        verticalVelocity = 0
        verticalVelocity_subpixel = 0
        verticalSpeed = 0
		break
    }
}
repeat (abs(horizontalVelocity))
{
    if (place_meeting((x + sign(horizontalVelocity)), y, myBlock) && (!(place_meeting((x + sign(horizontalVelocity)), (y - 1), myBlock))))
        y -= 1
    if ((!(place_meeting((x + sign(horizontalVelocity)), y, myBlock))) && (!(place_meeting((x + sign(horizontalVelocity)), (y + 1), myBlock))) && place_meeting((x + sign(horizontalVelocity)), (y + 2), myBlock))
        y += 1
    if (!(place_meeting((x + sign(horizontalVelocity)), y, myBlock)))
        x += sign(horizontalVelocity)
    else
    {
        horizontalVelocity = 0
        horizontalVelocity_subpixel = 0
        horizontalSpeed = 0
		break
    }
}
if b_warping
{
    horizontalSpeed = 0
    verticalSpeed = 0
    horizontalVelocity = 0
    horizontalVelocity_subpixel = 0
}
x = round(x)
y = round(y)
