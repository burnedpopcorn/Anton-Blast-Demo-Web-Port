draw_set_halign(fa_left)
draw_set_font(global.fontMain)
draw_text_ext_color((camera_get_view_x(view_camera[0]) + 8), (camera_get_view_y(view_camera[0]) + 198), string(global.roomString), 0, 384, c_white, c_white, c_white, c_white, spriteAlpha)
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
