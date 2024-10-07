function playerState_Crouch()
{
    self.updateHitbox()
    assign_layer_mask(sp_playerMaskCrouchFG, sp_playerMaskCrouchBG)
    if (clutchCooldownTimer > 0)
        clutchCooldownTimer -= 1
    if leftKey
        horizontalSpeed = approach(horizontalSpeed, -1, 0.25)
    else if rightKey
        horizontalSpeed = approach(horizontalSpeed, 1, 0.25)
    else
        horizontalSpeed = approach(horizontalSpeed, 0, 0.5)
    if (!b_onGround)
    {
        if (verticalSpeed < 0 && (!jumpKeyHeld))
            verticalSpeed *= jumpBrakePower
        if (coyoteTimeCounter > 0)
            coyoteTimeCounter -= 1
    }
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    if ((jumpKey || jumpBufferCounter > 0) && (!(place_meeting(x, y, myBlock))))
    {
        if (((!b_jumped) && b_onGround) || coyoteTimeCounter > 0)
        {
            audio_stop_sound(jumpSound)
            audio_play_sound(jumpSound, 1, false)
            jumpBufferCounter = 0
            coyoteTimeCounter = 0
            verticalSpeed = (jumpPower * 0.75)
            spriteFrame = 0
            spriteImage = sp_anton_crouchjump_start
            spriteFrameSpeed = 0.5
            b_transitioning = 1
            b_jumped = 1
        }
    }
    if (horizontalSpeed > 2.5)
        horizontalSpeed = approach(horizontalSpeed, 2.5, 0.1)
    else if (horizontalSpeed < -2.5)
        horizontalSpeed = approach(horizontalSpeed, -2.5, 0.1)
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    if ((!downKey) && b_onGround && (b_squashed || (!(place_meeting(x, y, myBlock)))))
    {
        spriteFrame = 0
        spriteImage = sp_anton_crouch_end
        spriteFrameSpeed = 0.33
        b_transitioning = 1
        currentState = playerstates.normal
    }
    assign_layer_mask(sp_playerMaskCrouchFG, sp_playerMaskCrouchBG)
}

