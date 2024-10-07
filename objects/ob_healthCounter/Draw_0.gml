draw_set_halign(fa_left)
if instance_exists(ob_player)
{
    for (var i = (ob_player.playerHealthMax - 1); i >= 0; i -= 1)
    {
        var _sprite = sp_lifeCounterHeart
        var _subimage = 0
        if (i == (ob_player.playerHealth - 1) && spinTimer >= 0)
        {
            _sprite = sp_lifeCounterSpin
            _subimage = map(spinTimer, spinDuration, 0, 0, (sprite_get_number(sp_lifeCounterSpin) - 1))
        }
        else if (i >= ob_player.playerHealth)
            _subimage = 1
        if (ob_player.playerHealth == 1)
        {
            spriteAlpha = 1
            spriteAlphaTimer = 240
        }
        draw_sprite_ext(_sprite, _subimage, ((camera_get_view_x(view_camera[0]) + 24) + (i * 16)), (camera_get_view_y(view_camera[0]) + 24), 1, 1, 0, c_white, spriteAlpha)
    }
}
if (spriteAlphaTimer > 0)
{
    spriteAlpha += 0.1
    spriteAlphaTimer -= 1
}
if (spriteAlpha > 1)
    spriteAlpha = 1
else if (spriteAlpha < 0)
    spriteAlpha = 0
if (spriteAlphaTimer == 0)
    spriteAlpha -= 0.1
