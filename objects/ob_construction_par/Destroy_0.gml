if conserved
{
    if instance_exists(ob_conservedObjectManager)
        variable_struct_set(variable_struct_get(ob_conservedObjectManager.instanceData, room), conservedID, "destroyed")
}
