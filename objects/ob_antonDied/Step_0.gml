if (spriteScale < 1)
{
    spriteScale += 0.075
    spriteScaleX = spriteScale
    spriteScaleY = spriteScale
    rectangleAlpha += 0.01
    spriteRotation -= 30
    if (spriteScale > 0.9)
    {
        audio_play_sound(sn_smack, 1, false)
        screenshake(1, 1, 30, 30)
        audio_play_sound(sn_antonVoice_annoyedHey, 1, false)
        instance_create_depth(x, y, (depth - 1000), ob_gameover_glassCrack)
        alarm[0] = 90
        b_textShowing = 1
        spriteScaleX = 1
        spriteScaleY = 1
        spriteScale = 1
    }
}
if b_sliding
{
    spriteScaleX -= 0.0025
    spriteScaleY += 0.005
    verticalSpeed += 0.1
    rectangleAlpha -= 0.005
    y += verticalSpeed
}
