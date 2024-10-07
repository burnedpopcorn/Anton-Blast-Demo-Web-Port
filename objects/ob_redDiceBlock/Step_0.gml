event_inherited()
if b_filled
{
    sprite_index = sp_redDice_on
    image_index = (sprite_get_number(sprite_index) - 1)
    mask_index = sp_block_FG
}
else
{
    sprite_index = sp_redDice_off
    image_index = (sprite_get_number(sprite_index) - 1)
    mask_index = sp_empty
}
if instance_exists(ob_diceManager)
{
    if ob_diceManager.b_redDiceOn
    {
        if b_defaultFill
            b_filled = 0
        else
            b_filled = 1
    }
    else if b_defaultFill
        b_filled = 1
    else
        b_filled = 0
}
