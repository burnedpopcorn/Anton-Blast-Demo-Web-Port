function draw_self_plus()
{
    if (myLayer == 1)
        var _xPosition = x
    else if (myLayer == 2)
        _xPosition = xPosition
    draw_sprite_ext(spriteImage, spriteFrame, round(_xPosition), round(y), (spriteScale * spriteFacing), spriteScale, spriteRotation, spriteColor, spriteAlpha)
}

function draw_self_gameplay_layer()
{
    if (!sprite_exists(sprite_index))
        return;
    if (myLayer == 1)
        var _xPosition = x
    else if (myLayer == 2)
        _xPosition = xPosition
    draw_sprite_ext(sprite_index, image_index, _xPosition, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}

function draw_self_grid()
{
    if (!sprite_exists(sprite_index))
        return;
    if (myLayer == 1)
        var _xPosition = x
    else if (myLayer == 2)
        _xPosition = xPosition
    for (var i = 0; i < image_xscale; i++)
    {
        for (var j = 0; j < image_yscale; j++)
            draw_sprite(sprite_index, image_index, (_xPosition + (i * sprite_get_width(sprite_index))), (y + (j * sprite_get_height(sprite_index))))
    }
}

