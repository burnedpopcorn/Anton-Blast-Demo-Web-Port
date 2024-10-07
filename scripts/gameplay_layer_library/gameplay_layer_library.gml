function parallax_adjust(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = 0
    if argument1
    {
        var _camPosAtPosition = ((argument0 - (ob_init.viewWidth / 2)) / 0.5)
        return round((argument0 + (clamp(_camPosAtPosition, 0, room_width) * 0.5)));
    }
    else
        return round((argument0 - (clamp((argument0 - (ob_init.viewWidth / 2)), 0, room_width) * 0.5)));
}

