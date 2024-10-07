function assign_layer_mask(argument0, argument1)
{
    if (argument0 == sp_playerMaskFG && b_squashed)
    {
        argument0 = sp_playerMaskCrouchFG
        argument1 = sp_playerMaskCrouchBG
    }
    if (myLayer == 1)
        mask_index = argument0
    else if (myLayer == 2)
        mask_index = argument1
}

