if b_hit
{
    if (rocketDirection == 1)
    {
        if (spriteRotation != 270)
        {
            spriteRotation -= 10
            if (spriteRotation <= 269)
            {
                alarm[0] = 60
                spriteRotation = 270
            }
        }
    }
}
if b_activated
{
    horizontalSpeed = approach(horizontalSpeed, (6 * rocketDirection), 0.5)
    if place_meeting((x + rocketDirection), (y - 1), ob_block_FG)
    {
        instance_create_depth((x + (69 * spriteFacing)), y, depth, ob_explosion)
        instance_destroy()
    }
}
x += horizontalSpeed
image_angle = spriteRotation
