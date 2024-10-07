function sprite_effect_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14)
{
    if (argument3 == undefined)
        argument3 = (depth - 1)
    var _drawerInstance = instance_create_depth(argument1, argument2, (argument3 - 1), ob_effectDrawer)
    with (_drawerInstance)
    {
        sprite_index = argument0
        if is_undefined(argument4)
            argument4 = floor((sprite_get_duration(argument0) / room_speed))
        if (!is_infinity(argument4))
            stopTimer = create_timer(stop, argument4)
        if (!is_undefined(argument5))
        {
            image_speed = 0
            image_index = argument5
        }
        image_xscale = (nc_set(argument6) ? global.nc_val : 0x000001)
        image_yscale = (nc_set(argument7) ? global.nc_val : 0x000001)
        image_angle = (nc_set(argument8) ? global.nc_val : c_black)
        image_blend = (nc_set(argument9) ? global.nc_val : c_white)
        image_alpha = (nc_set(argument10) ? global.nc_val : 1)
        drawEvent = (nc_set(argument11) ? global.nc_val : 8)
        destroy = (nc_set(argument12) ? global.nc_val : 1)
        blendmode = (nc_set(argument13) ? global.nc_val : 0)
    }
    return _drawerInstance;
}

function sprite_effect_stop(argument0)
{
    if (argument_count == 0)
    {
        instance_destroy(ob_effectDrawer)
        return;
    }
    if (is_instance(argument0) && argument0.object_index == ob_effectDrawer)
        instance_destroy(argument0)
}

