draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if instance_exists(ob_player)
{
    draw_set_font(global.fontLevelName)
    draw_text_transformed_color((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 64)), (camera_get_view_y(view_camera[0]) + 54), "X", 1, 1, 5, c_white, c_white, c_white, c_white, spriteAlpha)
    draw_set_font(global.fontComboCounter)
    draw_text_transformed_color((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 40)), (camera_get_view_y(view_camera[0]) + 54), comboCounter, spriteScale, spriteScale, 0, c_white, c_white, c_white, c_white, spriteAlpha)
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
{
    spriteAlpha -= 0.1
	if (comboCounter > 0)
	{
		ob_treasureCounter.leverFrameSpeed = 0.5
		comboCounter = 0
	}
}
if (spriteScale > 1)
    spriteScale -= 0.15
else
    spriteScale = 1
if (spriteScale > 2)
    spriteScale = 2
