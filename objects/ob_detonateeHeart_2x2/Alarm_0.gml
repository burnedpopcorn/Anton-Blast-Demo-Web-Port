if instance_exists(ob_detonatorManager)
{
    if ob_detonatorManager.b_heartSet
    {
        if (!b_activated)
            instance_destroy()
    }
}
