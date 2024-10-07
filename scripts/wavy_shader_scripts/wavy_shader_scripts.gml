function wavy_shader_layer_begin()
{
    if (event_type == 8 && event_number == 0)
    {
        with (global.wavy_data)
        {
            if (!surface_exists(surf))
                surf = surface_create(room_width, room_height)
            surface_set_target(surf)
            draw_clear_alpha(c_white, 0)
        }
    }
}

function wavy_shader_layer_end()
{
    static _wavyTime = 0
    if (event_type == 8 && event_number == 0)
    {
        if (surface_get_target() != -1)
            surface_reset_target()
        with (global.wavy_data)
        {
            if surface_exists(surf)
            {
                _wavyTime += (1 / room_speed)
                var tex = surface_get_texture(surf)
                var uv = texture_get_uvs(tex)
                var tex_w = texture_get_texel_width(tex)
                var tex_h = texture_get_texel_height(tex)
                var _timeHandle = shader_get_uniform(sh_Wavy, "time")
                var _uvHandle = shader_get_uniform(sh_Wavy, "uv")
                var _texelHandle = shader_get_uniform(sh_Wavy, "texel")
                var _amplitudeHandle = shader_get_uniform(sh_Wavy, "amplitude")
                var _periodHandle = shader_get_uniform(sh_Wavy, "period")
                shader_set(sh_Wavy)
                shader_set_uniform_f(_timeHandle, _wavyTime)
                shader_set_uniform_f(_amplitudeHandle, amplitude)
                shader_set_uniform_f(_periodHandle, period)
                shader_set_uniform_f(_uvHandle, uv[0], uv[1], uv[2], uv[3])
                shader_set_uniform_f(_texelHandle, tex_w, tex_h)
                draw_surface(surf, 0, 0)
                shader_reset()
            }
        }
    }
}

function wavy_shader_start(argument0)
{
    if (!variable_global_exists("wavy_data"))
    {
        global.wavy_data = 
        {
            surf: -1,
            amplitude: 5,
            period: 0.1
        }

    }
    if (!settings().wavyEnabled)
        return;
    with (global.wavy_data)
    {
        if (surface_exists(surf) && (surface_get_width(surf) != room_width || surface_get_height(surf) != room_height))
            surface_resize(surf, room_width, room_height)
    }
    if is_string(argument0)
        argument0 = layer_get_id(argument0)
    layer_script_begin(argument0, wavy_shader_layer_begin)
    layer_script_end(argument0, wavy_shader_layer_end)
}

function wavy_shader_set_values(argument0, argument1)
{
    if (argument0 == undefined)
        argument0 = 10
    if (argument1 == undefined)
        argument1 = 0.1
    with (global.wavy_data)
    {
        amplitude = argument0
        period = argument1
    }
}

function layer_scripts_clear(argument0)
{
    if is_string(argument0)
        argument0 = layer_get_id(argument0)
    layer_script_begin(argument0, -1)
    layer_script_end(argument0, -1)
}

