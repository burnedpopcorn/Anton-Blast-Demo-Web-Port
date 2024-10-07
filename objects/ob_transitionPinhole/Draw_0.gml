if (!surface_exists(surf))
    surf = surface_create(nearest_higher_power_of_2(384), nearest_higher_power_of_2(216))
if instance_exists(ob_player)
{
    var _drawPos = instance_get_bbox_center(instance_find(ob_player, 0))
    _drawPos.x = ob_player.xPosition
    _drawPos.add((-camera_get_view_x(view_camera[0])), (-camera_get_view_y(view_camera[0])))
}
else
{
    _drawPos = new vector2(384, 216)
    _drawPos.multiply(0.5)
}
//_drawPos.applyMethod(round)
surface_set_target(surf)
draw_clear_alpha(c_black, 1)
gpu_set_blendmode(bm_subtract)
draw_sprite_ext(sp_pinhole, 0, _drawPos.x, _drawPos.y, pinholeScale, pinholeScale, 0, c_white, 1)
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
