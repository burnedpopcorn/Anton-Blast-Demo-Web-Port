draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(global.fontMain)
draw_sprite_ext(sp_tutorialSpray, 1, (ob_init.viewWidth / 2), 2, 1, 1, 0, c_white, spriteAlpha)
draw_text_ext_color((ob_init.viewWidth / 2), 8, "Press Slide or Down while Charging to Slide!", 12, 222, c_white, c_white, c_white, c_white, spriteAlpha)
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
