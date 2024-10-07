function animation_frame_reset()
{
    if (spriteFrameSpeed > 0)
    {
        if (floor(spriteFrame) >= sprite_get_number(spriteImage))
        {
            spriteFrame = 0
            b_transitioning = 0
            b_transitionParticle = 0
        }
    }
}

