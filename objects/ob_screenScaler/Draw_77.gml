var _monitorWidth = window_get_width()
var _monitorHeight = (_monitorWidth * 0.5625)
var surfW = (surface_get_width(application_surface) * 4)
var surfH = (surface_get_height(application_surface) * 4)
if (!surface_exists(surf))
    surf = surface_create(surfW, surfH)
if (gbaShader == 1)
{
    surface_set_target(surf)
    draw_clear_alpha(c_black, 0)
    shader_set(sh_LCD)
    shader_set_uniform_f(shader_get_uniform(sh_LCD, "TextureSize"), (surfW / 4), (surfH / 4))
    draw_surface_ext(application_surface, 0, 0, 4, 4, 0, c_white, 1)
    shader_reset()
    surface_reset_target()
}
else
{
    surface_set_target(surf)
    draw_surface_ext(application_surface, 0, 0, 4, 4, 0, c_white, 1)
    surface_reset_target()
}
if window_get_fullscreen()
{
    shader_set(sh_coveragePixel)
    bitmap_width = shader_get_uniform(sh_coveragePixel, "bitmap_width")
    shader_set_uniform_f(bitmap_width, surfW)
    bitmap_height = shader_get_uniform(sh_coveragePixel, "bitmap_height")
    shader_set_uniform_f(bitmap_height, surfH)
    x_scale = shader_get_uniform(sh_coveragePixel, "x_scale")
    shader_set_uniform_f(x_scale, (_monitorWidth / surfW))
    y_scale = shader_get_uniform(sh_coveragePixel, "y_scale")
    shader_set_uniform_f(y_scale, (_monitorHeight / surfH))
    draw_surface_ext(surf, 0, ((window_get_height() - _monitorHeight) / 2), (_monitorWidth / surfW), (_monitorHeight / surfH), 0, c_white, 1)
    shader_reset()
}
// for shit to be scaled right on startup
else if !window_get_fullscreen() {
	shader_set(sh_coveragePixel)
    bitmap_width = shader_get_uniform(sh_coveragePixel, "bitmap_width")
    shader_set_uniform_f(bitmap_width, surfW)
    bitmap_height = shader_get_uniform(sh_coveragePixel, "bitmap_height")
    shader_set_uniform_f(bitmap_height, surfH)
    x_scale = shader_get_uniform(sh_coveragePixel, "x_scale")
    shader_set_uniform_f(x_scale, (_monitorWidth / surfW))
    y_scale = shader_get_uniform(sh_coveragePixel, "y_scale")
    shader_set_uniform_f(y_scale, (_monitorHeight / surfH))
    draw_surface_ext(surf, 0, 0, 0.5, 0.5, 0, c_white, 1)
    shader_reset()
	// preserver scale when fullscreen is cancelled
	ob_init.resizeWindow()
}
//else
    //draw_surface_ext(surf, 0, ((window_get_height() - _monitorHeight) / 2), (_monitorWidth / surfW), (_monitorHeight / surfH), 0, c_white, 1)
