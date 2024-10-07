function memoryVar(argument0, argument1) constructor
{
    var update = function()
    {
        var _params = array_create(argument_count)
        for (var i = 0; i < argument_count; i++)
            _params[i] = argument[i]
        var _current = function_execute(checkFunction, _params)
        var _out = _current != value
        value = _current
        return _out;
    }

    checkFunction = method(other, argument0)
    value = (nc_set(argument1) ? global.nc_val : 0)
}

