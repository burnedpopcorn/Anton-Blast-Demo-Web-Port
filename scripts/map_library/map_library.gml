function ds_map_add_multiple()
{
    var _map = argument[0]
    for (var i = 1; i < argument_count; i++)
    {
        var _pair = argument[i]
        ds_map_add(_map, _pair[0], _pair[1])
    }
}

