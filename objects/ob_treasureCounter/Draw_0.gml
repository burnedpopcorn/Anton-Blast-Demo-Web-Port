draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (spriteScale > 1)
    spriteScale -= 0.1
if (spriteScale > 3)
    spriteScale = 3
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
draw_sprite_ext(sp_pointCounter, 0, (camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 78)), (camera_get_view_y(view_camera[0]) + 7), 1, 1, 0, c_white, spriteAlpha)
draw_sprite_ext(sp_pointCounterLever, leverFrame, (camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 12)), (camera_get_view_y(view_camera[0]) + 16), 1, 1, 0, c_white, spriteAlpha)
draw_set_font(global.fontPointCounter)
draw_text_transformed_color((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 75)), (camera_get_view_y(view_camera[0]) + 14), displayString, 1, 1, 0, c_white, c_white, c_white, c_white, spriteAlpha)
draw_sprite_ext(sprite_index, image_index, (camera_get_view_x(view_camera[0]) + (ob_init.viewWidth - 86)), (camera_get_view_y(view_camera[0]) + 18), spriteScale, spriteScale, 0, c_white, spriteAlpha)
