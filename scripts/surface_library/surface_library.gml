function surface_outline_create(argument0, argument1, argument2)
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument1 == undefined)
        argument1 = 1
    var _returnSurface = surface_create(surface_get_width(argument0), surface_get_height(argument0))
    surface_set_target(_returnSurface)
    draw_clear_alpha(c_black, 0)
    shader_set((argument2 ? sh_ceilAlpha : sh_ceil))
    draw_surface(argument0, argument1, argument1)
    draw_surface(argument0, argument1, (-argument1))
    draw_surface(argument0, (-argument1), argument1)
    draw_surface(argument0, (-argument1), (-argument1))
    draw_surface(argument0, argument1, 0)
    draw_surface(argument0, 0, (-argument1))
    draw_surface(argument0, (-argument1), 0)
    draw_surface(argument0, 0, argument1)
    shader_reset()
    gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha)
    draw_surface(argument0, 0, 0)
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    return _returnSurface;
}

function gpu_set_blendmode_normal_surface()
{
    gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
}

function surface_default_setup(argument0)
{
    surface_set_target(argument0)
    gpu_set_blendmode_normal_surface()
    draw_clear_alpha(c_black, 0)
}

function surface_view_create()
{
    return surface_create(nearest_higher_power_of_2(384), nearest_higher_power_of_2(216));
}

function surface_view_get()
{
     static _surf = -1
    if (!surface_exists(_surf))
        _surf = surface_view_create()
    surface_set_target(_surf)
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
    return _surf;
}

