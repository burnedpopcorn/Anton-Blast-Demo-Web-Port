if (currentPage == settingsPage)
	draw_sprite_tiled(sp_static, sprite_get_current_subimage(sp_static), 0, 0)
if (currentPage == levelSelectPage)
{
	draw_set_color(c_black)
	draw_rectangle(0, 0, room_width, room_height, false)
	draw_set_color(c_white)
}
event_inherited()
if (currentPage == mainPage)
{
    draw_sprite(sp_titleLogo, 0, 192, 8)
    draw_sprite(sp_copyright, 0, 192, 206)
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_font(fn_credits)
	draw_text(8, 200, "V1.2")
}

