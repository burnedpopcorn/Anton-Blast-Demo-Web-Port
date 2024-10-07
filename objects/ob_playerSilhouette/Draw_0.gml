if (myPlayer.myLayer != 2)
    return;
if (!surface_exists(negativeSurface))
    negativeSurface = surface_create(room_width, room_height)
if (!surface_exists(silhouetteSurface))
    silhouetteSurface = surface_create(room_width, room_height)
surface_set_target(negativeSurface)
draw_clear_alpha(c_white, 1)
gpu_set_blendmode(bm_subtract)
var _camBounds = new rect(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 384, 216)
with (all)
{
    if (depth < other.myPlayer.depth && id != other.id && rectangle_in_rectangle(_camBounds.x, _camBounds.y, _camBounds.getRight(), _camBounds.getBottom(), (x - (sprite_width / 2)), (y - (sprite_height / 2)), (x + (sprite_width / 2)), (y + (sprite_height / 2))) > 0)
    {
        event_perform(ev_draw, ev_draw_begin)
        event_perform(ev_draw, 0)
        event_perform(ev_draw, ev_draw_end)
    }
}
for (var i = 0; i < array_length(layers); i++)
{
    if (layer_get_depth(layers[i]) >= myPlayer.depth)
    {
    }
    else
    {
        var _tilemap = layer_tilemap_get_id(layers[i])
        if (_tilemap != -1)
            draw_tilemap(_tilemap, 0, 0)
    }
}
surface_reset_target()
surface_default_setup(silhouetteSurface)
shader_set(sh_ceil)
with (myPlayer)
    event_perform(ev_draw, 0)
shader_reset()
gpu_set_blendmode(bm_subtract)
draw_surface(negativeSurface, 0, 0)
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface_ext(silhouetteSurface, 0, 0, 1, 1, 0, c_black, 0.5)
