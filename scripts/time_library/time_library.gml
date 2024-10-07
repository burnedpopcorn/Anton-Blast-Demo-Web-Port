function frames_to_timer_string(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = 0
    return string_replace_all(((string_format(floor(((argument0 / 60) / 60)), 2, 0) + ":") + string_format(((argument0 / 60) % 60), 2, (argument1 ? 3 : 0))), " ", "0");
}

