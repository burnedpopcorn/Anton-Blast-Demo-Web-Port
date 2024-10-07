function angle_cardinal_to_vector2(argument0)
{
    argument0 = angle_cardinal_to_degree(argument0)
    return angle_degree_to_vector2(argument0);
}

function angle_cardinal_to_vector2_fast(argument0, argument1)
{
    switch argument0
    {
        case ob_player:
            return new vector2(argument1, 0);
        case ob_chipBig_float:
            return new vector2(0, (-argument1));
        case ob_slope45l_FG:
            return new vector2((-argument1), 0);
        case ob_ballbuster:
            return new vector2(0, argument1);
    }

}

function angle_cardinal_to_degree(argument0)
{
    argument0 = wrap(argument0, 0, 3)
    return map(argument0, 0, 4, 0, 360);
}

function angle_degree_to_vector2(argument0)
{
    return new vector2(dcos(argument0), (-dsin(argument0)));
}

function angle_predict_projectile(argument0, argument1, argument2, argument3, argument4)
{
    if (argument4 == undefined)
        argument4 = 0
    var _flip = 0
    var _delta = argument1.copy()
    if (argument0.x > argument1.x)
    {
        _flip = 1
        _delta.x = (argument0.x + (argument0.x - argument1.x))
    }
    _delta.subVector(argument0)
    _delta.y = (-_delta.y)
    var _sqrtComponent = (power(argument2, 4) - (argument3 * ((argument3 * sqr(_delta.x)) + ((2 * _delta.y) * sqr(argument2)))))
    if (_sqrtComponent < 0)
        return (_flip ? 135 : 45);
    var _out = (argument4 ? arctan(((sqr(argument2) + sqrt(_sqrtComponent)) / (argument3 * _delta.x))) : arctan(((sqr(argument2) - sqrt(_sqrtComponent)) / (argument3 * _delta.x))))
    _out = radtodeg(_out)
    if _flip
        _out += ((90 - _out) * 2)
    _out = wrap(_out, 0, 359)
    return _out;
}

