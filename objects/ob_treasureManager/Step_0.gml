if b_spiritCollected
{
    if (!instance_exists(ob_spirit))
        instance_create_depth(ob_player.xPosition, ob_player.y, ob_player.depth, ob_spirit)
}
