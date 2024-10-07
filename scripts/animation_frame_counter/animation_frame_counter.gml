function animation_frame_counter()
{
    if (spriteFrameSpeed > 0)
        spriteFrame += spriteFrameSpeed
    else if (spriteFrameSpeed < 0)
        spriteFrame -= spriteFrameSpeed
}

