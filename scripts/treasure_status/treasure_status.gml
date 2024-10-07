function treasure_status()
{
    if instance_exists(ob_treasureManager)
    {
        var _spawnStatus = ds_map_find_value(ob_treasureManager.treasureStatus, key)
        if ((!is_undefined(_spawnStatus)) && _spawnStatus)
            function_execute(instance_destroy, id, 1)
    }
}

