if (sprite_index == enterSprite)
{
    with (instance_create_layer(x, y, "System", ob_manholeWarpHandler))
    {
        targetRoom = other.targetRoom
        targetManholeID = other.targetManholeID
        if (targetRoom != -1)
        {
            with (instance_create_layer(x, y, "System", ob_transitionPinhole))
                onMidTransition = other.warpExecute
        }
        else
            self.warpExecute()
    }
}
else
    sprite_index = enterSprite
image_index = 0
image_speed = 0
