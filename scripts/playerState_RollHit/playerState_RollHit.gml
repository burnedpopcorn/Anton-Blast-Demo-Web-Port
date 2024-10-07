function playerState_RollHit()
{
    self.updateHitbox()
    assign_layer_mask(sp_playerMaskCrouchFG, sp_playerMaskCrouchBG)
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    horizontalSpeed = approach(horizontalSpeed, (2 * (-spriteFacing)), 0.5)
    if (myLayer == 1)
        var knockbackSpeed = 1
    else
        knockbackSpeed = 0.5
    if b_onGround
    {
        b_jumped = 1
        coyoteTimeCounter = 0
        currentState = playerstates.crouch
    }
}

