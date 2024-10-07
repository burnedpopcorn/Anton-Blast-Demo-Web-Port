function instance_destroy_multiple()
{
    for (var i = 0; i < argument_count; i++)
        instance_destroy(argument[i])
}

function is_instance(argument0)
{
    return (argument0 >= 100000 && instance_exists(argument0));
}

function instance_comparison(argument0, argument1)
{
    if (is_undefined(argument1) || argument1 == noone)
        return 0;
    if (argument1 == all)
        return 1;
    if is_array(argument1)
    {
        for (var i = 0; i < array_length(argument1); i++)
        {
            if instance_comparison(argument0, argument1[i])
                return 1;
        }
        return 0;
    }
    if (argument1 >= 100000)
        return argument1 == argument0;
    else
        return (object_is_ancestor(argument0.object_index, argument1) || argument0.object_index == argument1);
}

