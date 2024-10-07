if (!(variable_struct_exists(instanceData, room)))
{
    variable_struct_set(instanceData, room, {})
    return;
}
var _roomData = variable_struct_get(instanceData, room)
with (ob_construction_par)
{
    if ((!is_undefined(conservedID)) && variable_struct_exists(_roomData, conservedID))
    {
        if (variable_struct_get(_roomData, conservedID) == "destroyed")
            instance_destroy()
        else
            instance_variables_load(id, variable_struct_get(_roomData, conservedID))
    }
}
