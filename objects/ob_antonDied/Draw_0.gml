draw_set_halign(fa_left)
draw_set_color(c_black)
draw_set_alpha(rectangleAlpha)
draw_rectangle(0, 0, room_width, room_height, false)
draw_set_alpha(spriteAlpha)
if (myLayer == 1)
    var _xPosition = x
else if (myLayer == 2)
    _xPosition = xPosition
draw_sprite_ext(spriteImage, spriteFrame, round(_xPosition), round(y), (spriteScaleX * spriteFacing), spriteScaleY, spriteRotation, spriteColor, spriteAlpha)
