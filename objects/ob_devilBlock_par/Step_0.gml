if b_filled
{
    sprite_index = sp_devilBlockFilled_FG
    image_speed = 1
    mask_index = sprite_index
}
else if (!b_filled)
{
    sprite_index = sp_devilBlock_FG
    image_index = 1
    image_speed = 0
    mask_index = sp_empty
}
