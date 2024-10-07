function struct_find(argument0, argument1)
{
    var _varNames = variable_struct_get_names(argument0)
    var __i = 0
    if (__i < array_length(_varNames))
        var _name = _varNames[0]
    while (__i < array_length(_varNames))
    {
        if (variable_struct_get(argument0, _name) == argument1)
            return _name;
        __i++
        if (__i < array_length(_varNames))
            _name = _varNames[__i]
    }
    return undefined;
}

function struct_find_array_fast(argument0, argument1)
{
    var _varNames = variable_struct_get_names(argument0)
    var _reverseMap = ds_map_create()
    for (var i = 0; i < array_length(_varNames); i++)
    {
        var _val = variable_struct_get(argument0, _varNames[i])
        if (!(ds_map_exists(_reverseMap, _val)))
            ds_map_set(_reverseMap, _val, _varNames[i])
    }
    var _valueCount = array_length(argument1)
    var _out = array_create(_valueCount, undefined)
    for (i = 0; i < _valueCount; i++)
    {
        if ds_map_exists(_reverseMap, argument1[i])
            _out[i] = ds_map_find_value(_reverseMap, array_get(argument1, i))
    }
    ds_map_destroy(_reverseMap)
    return _out;
}

function struct_load(argument0, argument1)
{
    var _names = variable_struct_get_names(argument0)
    for (var i = 0; i < array_length(_names); i++)
        variable_struct_set(argument1, _names[i], variable_struct_get(argument0, _names[i]))
    return argument1;
}

function variable_struct_change_name(argument0, argument1, argument2)
{
    if (!(variable_struct_exists(argument0, argument1)))
        return;
    var _val = variable_struct_get(argument0, argument1)
    variable_struct_remove(argument0, argument1)
    variable_struct_set(argument0, argument2, _val)
}

