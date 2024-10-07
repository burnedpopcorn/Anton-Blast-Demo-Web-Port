if instance_exists(ob_detonatorManager)
{
    if ob_detonatorManager.b_clubSet
    {
        if (!b_activated)
            instance_destroy()
    }
}
