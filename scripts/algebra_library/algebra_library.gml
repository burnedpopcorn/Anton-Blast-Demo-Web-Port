function add_multiple()
{
    var _n = 0
    for (var i = 0; i < argument_count; i++)
        _n += argument[i]
    return _n;
}

function wrap(argument0, argument1, argument2)
{
    var _incr = ((argument2 - argument1) + 1)
    if (argument0 > argument2)
        argument0 = ((((argument0 - argument2) % _incr) + argument1) - 1)
    if (argument0 < argument1)
        argument0 = ((((argument0 - argument1) % _incr) + argument2) + 1)
    return argument0;
}

function map(argument0, argument1, argument2, argument3, argument4)
{
    return lerp(argument3, argument4, ((argument0 - argument1) / (argument2 - argument1)));
}

function select_closest()
{
    var _n = argument[0]
    var _out = argument[1]
    for (var i = 2; i < argument_count; i++)
    {
        if (abs((_n - argument[i])) < abs((_n - _out)))
            _out = argument[i]
    }
    return _out;
}

function wave(argument0, argument1, argument2, argument3, argument4)
{
    if (argument3 == undefined)
        argument3 = 0
    argument3 += 0.75
    if (argument4 == undefined)
        argument4 = (current_time / 1000)
    var _amplitude = ((argument1 - argument0) / 2)
    return ((argument0 + _amplitude) + (sin((((argument4 + (argument2 * argument3)) / argument2) * (2 * pi))) * _amplitude));
}

function wave_in_out(argument0, argument1, argument2, argument3)
{
    if is_undefined(argument2)
        argument0 = map(argument0, 0, 1, 0.5, 1)
    else if is_undefined(argument3)
        argument0 = map(argument0, 0, 1, 0, 0.5)
    if (argument0 < 0.5)
        var _out = wave(((argument2 * 2) - argument1), argument1, 2, 0, (argument0 + 0.5))
    else if (argument0 > 0.5)
        _out = wave(argument1, ((argument3 * 2) - argument1), 2, 0, (argument0 - 0.5))
    else
        _out = argument1
    return _out;
}

function loop(argument0, argument1, argument2, argument3, argument4)
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = (current_time / 1000)
    var _a = (((argument4 + argument3) % argument2) / argument2)
    if (_a == 1)
        _a = 0
    return lerp(argument0, argument1, _a);
}

function remove_frac(argument0)
{
    if (argument0 >= 0)
        return floor(argument0);
    else
        return ceil(argument0);
}

function cutoff(argument0, argument1, argument2)
{
    if (argument0 == clamp(argument0, argument1, argument2))
        return 0;
    return argument0;
}

function cantor_pairing(argument0, argument1)
{
    return ((((argument0 + argument1) * ((argument0 + argument1) + 1)) * 0.5) + argument0);
}

function inverse_lerp(argument0, argument1, argument2)
{
    return ((argument2 - argument0) / (argument1 - argument0));
}

function nearest_higher_power_of_2(argument0)
{
    argument0 = ceil(abs(argument0))
    argument0 -= 1
    argument0 |= (argument0 >> 1)
    argument0 |= (argument0 >> 2)
    argument0 |= (argument0 >> 4)
    argument0 |= (argument0 >> 8)
    argument0 |= (argument0 >> 16)
    argument0 += 1
    return argument0;
}

function nearest_multiple(argument0, argument1)
{
    argument0 += (argument1 / 2)
    argument0 -= (argument0 % argument1)
    return argument0;
}

function in_ranges(argument0)
{
    if (!is_array(argument[1]))
    {
        if (argument_count == 2)
        {
            if (argument0 == argument[1])
                return 1;
        }
        else if (argument0 >= argument[1] && argument0 <= argument[2])
            return 1;
        return 0;
    }
    for (var i = 1; i < argument_count; i++)
    {
        var _range = argument[i]
        if (array_length(_range) == 1)
        {
            if (argument0 == _range[0])
                return 1;
        }
        else if (argument0 >= _range[0] && argument0 <= _range[1])
            return 1;
    }
    return 0;
}

