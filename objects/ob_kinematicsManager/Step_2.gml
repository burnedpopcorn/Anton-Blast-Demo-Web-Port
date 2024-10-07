ds_priority_clear(kinematicsQueue)
with (ob_construction_par)
{
    if (kinematic && (!self.collisionCheck()))
        ds_priority_add(other.kinematicsQueue, id, bbox_bottom)
}
while (ds_priority_size(kinematicsQueue) > 0)
{
    with (ds_priority_delete_max(kinematicsQueue))
    {
        var i = 0
        while ((!self.collisionCheck()) && i < other.gravitySpeed)
            i += 1
        y += i
    }
}
