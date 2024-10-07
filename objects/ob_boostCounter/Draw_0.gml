draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if (!instance_exists(ob_player))
	exit;

if (boostCounter > 0)
{
	draw_set_font(global.fontLevelName)
	draw_text_transformed_color((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 64)), (camera_get_view_y(view_camera[0]) + 192), "X", 1, 1, 10, c_white, c_white, c_white, c_white, spriteAlpha)
	draw_text_transformed_color((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 48)), (camera_get_view_y(view_camera[0]) + 206), "Boosts", 1, 1, 10, c_white, c_white, c_white, c_white, spriteAlpha)
	draw_set_font(global.fontComboCounter)
	draw_text_transformed_color((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 42)), (camera_get_view_y(view_camera[0]) + 188), boostCounter, spriteScale, spriteScale, 0, c_white, c_white, c_white, c_white, spriteAlpha)
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
	boostCounter = 0
}
if (spriteScale > 1)
	spriteScale -= 0.15
else
	spriteScale = 1
if (spriteScale > 2)
	spriteScale = 2

var boostTimer = ob_player.clutchTimer
var boostTimerMax = ob_player.clutchTimerMax

if (boostTimer < 0)
	boostTimer = 0

// The fill is upside down for the bar itself to go from bottom to top.
if (boostTimer > 0 && ob_player.currentState == playerstates.clutch)
{
	if (boostTimer < 15)
		pal_swap_set(sp_boostBarFill_palette, 1, false)
	draw_sprite_part_ext(sp_boostBarFill, 0, 0, 0, sprite_get_width(sp_boostBarFill), sprite_get_height(sp_boostBarFill) - (boostTimer * 1.5), (camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 23)), (camera_get_view_y(view_camera[0]) + 212), 1, -1, c_white, spriteAlpha)
	pal_swap_reset()
}

// Old fill for testing
//if (boostTimer > 0 && ob_player.currentState == playerstates.clutch)
//	draw_healthbar((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 24)), (camera_get_view_y(view_camera[0]) + 164), (camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 8)), (camera_get_view_y(view_camera[0]) + 212), (boostTimerMax - boostTimer) * 3.3, c_black, c_green, c_red, 3, false, false)

draw_sprite_ext(sprite_index, image_index, (camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 8)), (camera_get_view_y(view_camera[0]) + 212), 1, 1, 0, c_white, spriteAlpha)