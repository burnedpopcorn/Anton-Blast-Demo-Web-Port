b_onGround = (check_below() || check_below_passthrough())
if b_onGround
{
    verticalSpeed = 0
    verticalVelocity_subpixel = 0
    b_jumped = 0
}
else if (!b_warping)
    verticalSpeed += gravitySpeed
