if (!(variable_struct_exists(instanceData, room)))
    return;
with (ob_construction_par)
{
    if conserved
        variable_struct_set(variable_struct_get(other.instanceData, room), conservedID, instance_variables_save(id))
}
