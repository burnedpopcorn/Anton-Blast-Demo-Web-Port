function function_execute(argument0, argument1, argument2)
{
	var functionarg = argument0;
    if (argument2 == undefined)
        argument2 = 0
    if (argument1 == undefined)
        argument1 = []
    if (!is_array(argument1))
        argument1 = [argument1]
    if (argument2 > 0)
    {
        var _obj = instance_create(ob_delay)
        _obj.myFunction = argument0
        _obj.alarm[0] = argument2
        if (array_length(argument1) > 0)
            _obj.myParams = argument1
        return _obj;
    }
    if is_method(argument0)
    {
        switch array_length(argument1)
        {
            case 0:
                return functionarg();
            case 1:
                return functionarg(argument1[0]);
            case 2:
                return functionarg(argument1[0], argument1[1]);
            case 3:
                return functionarg(argument1[0], argument1[1], argument1[2]);
            case 4:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3]);
            case 5:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4]);
            case 6:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5]);
            case 7:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6]);
            case 8:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7]);
            case 9:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8]);
            case 10:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9]);
            case 11:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10]);
            case 12:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11]);
            case 13:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12]);
            case 14:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12], argument1[13]);
            case 15:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12], argument1[13], argument1[14]);
            case 16:
                return functionarg(argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12], argument1[13], argument1[14], argument1[15]);
        }

    }
    switch array_length(argument1)
    {
        case 0:
            return script_execute(argument0);
        case 1:
            return script_execute(argument0, argument1[0]);
        case 2:
            return script_execute(argument0, argument1[0], argument1[1]);
        case 3:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2]);
        case 4:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3]);
        case 5:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4]);
        case 6:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5]);
        case 7:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6]);
        case 8:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7]);
        case 9:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8]);
        case 10:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9]);
        case 11:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10]);
        case 12:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11]);
        case 13:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12]);
        case 14:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12], argument1[13]);
        case 15:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12], argument1[13], argument1[14]);
        case 16:
            return script_execute(argument0, argument1[0], argument1[1], argument1[2], argument1[3], argument1[4], argument1[5], argument1[6], argument1[7], argument1[8], argument1[9], argument1[10], argument1[11], argument1[12], argument1[13], argument1[14], argument1[15]);
    }

}

function method_inherited(argument0)
{
    with (method_get_self(argument0))
    {
        currentIndex -= 1
        return function_execute(methods[currentIndex], currentArguments);
    }
}

function method_inheritance_data(argument0, argument1) constructor
{
    methods = [argument0, argument1]
    currentArguments = []
    currentIndex = 0
    childWrapper = function()
    {
        currentIndex = (array_length(methods) - 1)
        currentArguments = []
        for (var i = 0; i < argument_count; i++)
            currentArguments[i] = argument[i]
        return function_execute(methods[currentIndex], currentArguments);
    }

}

function function_apply_to_array(argument0, argument1, argument2, argument3)
{
    if (argument2 == undefined)
        argument2 = []
    if (argument3 == undefined)
        argument3 = 0
    var _paramCount = (array_length(argument2) + 1)
    var _params = array_create(_paramCount)
    var j = 0
    for (var i = 0; i < _paramCount; i++)
    {
        if (i != argument3)
        {
            _params[i] = argument2[j]
            j++
        }
    }
    var _arrayLength = array_length(argument1)
    var _out = array_create(_arrayLength)
    for (i = 0; i < _arrayLength; i++)
    {
        _params[argument3] = argument1[i]
        _out[i] = function_execute(argument0, _params)
    }
    return _out;
}

