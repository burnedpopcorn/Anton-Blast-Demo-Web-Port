/// @params object_index
/// @params vector2
/// @params depth
function instance_create(argument0, argument1 = new vector2(), argument2 = 0)
{
    if (asset_has_tags(argument0, "singleton", 0) && instance_exists(argument0))
        return -4;
    return instance_create_depth(argument1.x, argument1.y, argument2, argument0);
}

function variable_instance_set_all(argument0, argument1, argument2)
{
    with (argument0)
        variable_instance_set(id, argument1, argument2)
}

function instance_variables_save(argument0, argument1)
{
    if is_undefined(argument1)
    {
        argument1 = ["visible", "persistent", "depth", "x", "y", "image_alpha", "image_angle", "image_blend", "image_index", "image_speed", "image_xscale", "image_yscale"]
        array_append(argument1, variable_instance_get_names(argument0))
    }
    var _save = {}
    for (var i = 0; i < array_length(argument1); i++)
        variable_struct_set(_save, argument1[i], variable_instance_get(argument0, argument1[i]))
    return json_stringify(_save);
}

function instance_variables_load(argument0, argument1)
{
    var _loadStruct = json_parse(argument1)
    var _varNames = variable_struct_get_names(_loadStruct)
    var __i = 0
    if (__i < array_length(_varNames))
        var _string = _varNames[0]
    while (__i < array_length(_varNames))
    {
        variable_instance_set(argument0, _string, variable_struct_get(_loadStruct, _string))
        __i++
        if (__i < array_length(_varNames))
            _string = _varNames[__i]
    }
}

