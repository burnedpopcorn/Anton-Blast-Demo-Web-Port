function playerState_Death()
{
    self.updateHitbox()
    assign_layer_mask(sp_empty, sp_empty)
    horizontalSpeed = 0
    verticalSpeed = 0
    spriteImage = sp_empty
}

