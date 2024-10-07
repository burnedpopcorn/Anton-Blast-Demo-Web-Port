if instance_exists(ob_runbackManager)
{
    if (place_meeting(x, y, ob_player) && (!ob_runbackManager.b_runbackStarted))
    {
        if (ob_player.myLayer == 1)
        {
            ob_tutorialSign_Roll.spriteAlphaTimer = 0
            spriteAlphaTimer = 240
        }
    }
}
