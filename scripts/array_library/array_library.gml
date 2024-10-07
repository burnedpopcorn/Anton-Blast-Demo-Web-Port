function array_append(argument0, argument1, argument2)
{
    if (argument2 == undefined)
        argument2 = 1
    if (is_array(argument1) && argument2)
    {
        for (var i = 0; i < array_length(argument1); i++)
            array_push(argument0, argument1[i])
    }
    else
        array_push(argument0, argument1)
}

function array_choose_random(argument0)
{
    return argument0[irandom((array_length(argument0) - 1))];
}

function array_get_last(argument0, argument1)
{
    if (!is_array(argument0))
        return argument0;
    if (array_length(argument0) == 0)
        return undefined;
    if is_undefined(argument1)
        return argument0[(array_length(argument0) - 1)];
    return argument0[min(argument1, (array_length(argument0) - 1))];
}

function array_append_missing(argument0, argument1)
{
    if (!is_array(argument1))
        argument1 = [argument1]
    if (array_length(argument1) == 0)
        return;
    var _targetValuesMap = ds_map_create()
    for (var i = 0; i < array_length(argument0); i++)
        ds_map_add(_targetValuesMap, argument0[i], 1)
    for (i = 0; i < array_length(argument1); i++)
    {
        if (!(ds_map_exists(_targetValuesMap, argument1[i])))
        {
            ds_map_add(_targetValuesMap, argument1[i], 1)
            array_push(argument0, argument1[i])
        }
    }
    ds_map_destroy(_targetValuesMap)
}

function array_find(argument0, argument1)
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        if (argument0[i] == argument1)
            return i;
    }
    return undefined;
}

function array_copy_recursive(argument0)
{
    var _newArray = array_create(array_length(argument0))
    for (var i = 0; i < array_length(argument0); i++)
    {
        if is_array(argument0[i])
            _newArray[i] = array_copy_recursive(argument0[i])
        else
            _newArray[i] = argument0[i]
    }
    return _newArray;
}

