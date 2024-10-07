function playerState_ClutchHit()
{
    self.updateHitbox()
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    b_transitioning = 0
    b_airHammerSwung = 1
    verticalSpeed = (verticalSpeed > maxFallSpeed ? maxFallSpeed : verticalSpeed)
    if (myLayer == 1)
        var knockbackSpeed = 1
    else
        knockbackSpeed = 0.5
    if (stunTimer > 0)
        stunTimer -= 1
    if (stunTimer == 0 || b_onGround)
    {
        b_jumped = 1
        coyoteTimeCounter = 0
        currentState = playerstates.normal
    }
}

