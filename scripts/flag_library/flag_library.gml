function flag(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = 1
    if (!variable_global_exists("flags"))
    {
        global.flags = {}
    }
    variable_struct_set(global.flags, argument0, argument1)
}

function flag_check(argument0)
{
    if (variable_global_exists("flags") && variable_struct_exists(global.flags, argument0))
        return variable_struct_get(global.flags, argument0);
    return 0;
}

