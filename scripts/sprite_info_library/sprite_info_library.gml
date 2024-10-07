function sprite_get_current_subimage(argument0)
{
    var _spriteNum = (sprite_get_number(argument0) - 1)
    if (_spriteNum == 0)
        return 0;
    return wrap(floor(((current_time / 1000) * sprite_get_speed(argument0))), 0, _spriteNum);
}

function sprite_get_current_subimage_pingpong(argument0)
{
    var _reverse = sign(loop(1, -1, (sprite_get_duration(argument0) * 2)))
    var _subimage = sprite_get_current_subimage(argument0)
    if (_reverse <= 0)
        _subimage = ((sprite_get_number(argument0) - _subimage) - 1)
    return _subimage;
}

function sprite_get_duration(argument0)
{
    var _speed = sprite_get_speed(argument0)
    if (_speed == 0)
        return 0;
    return (sprite_get_number(argument0) / _speed);
}

function sprite_get_frame_duration(argument0)
{
    return (round((sprite_get_duration(argument0) * room_speed)) - 1);
}

