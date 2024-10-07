function speed_subpixel()
{
    horizontalVelocity_subpixel += horizontalSpeed
    verticalVelocity_subpixel += verticalSpeed
    if (myLayer == 2)
    {
        horizontalVelocity_subpixel -= (horizontalSpeed / 2)
        verticalVelocity_subpixel -= (verticalSpeed / 2)
        depth = (layer_get_depth("InstancesBG") - 50)
    }
    else
        depth = (layer_get_depth("InstancesFG") - 50)
    horizontalVelocity = int64(horizontalVelocity_subpixel)
    verticalVelocity = int64(verticalVelocity_subpixel)
    horizontalVelocity_subpixel -= horizontalVelocity
    verticalVelocity_subpixel -= verticalVelocity
}

