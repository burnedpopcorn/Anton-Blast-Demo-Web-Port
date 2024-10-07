event_inherited()
if instance_exists(ob_diceManager)
{
    if ob_diceManager.b_greenDiceOn
    {
        sprite_index = sp_greenDice_on
        image_index = (sprite_get_number(sprite_index) - 1)
        mask_index = sp_block_FG
    }
    else
    {
        sprite_index = sp_greenDice_off
        image_index = (sprite_get_number(sprite_index) - 1)
        mask_index = sp_empty
    }
}
