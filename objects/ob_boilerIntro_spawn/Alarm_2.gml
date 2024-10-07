if (!instance_exists(ob_treasureCounter))
{
    instance_create_layer(0, 0, "System", ob_comboCounter)
    instance_create_layer(0, 0, "System", ob_boostCounter)
    instance_create_layer(0, 0, "System", ob_treasureCounter)
    with (instance_create_layer(0, 0, "System", ob_healthCounter))
        spriteAlpha = 0
    instance_create_layer(0, 0, "System", ob_treasureManager)
    instance_create_layer(0, 0, "System", ob_runbackManager)
    instance_create_layer(0, 0, "System", ob_detonatorManager)
    instance_create_layer(0, 0, "System", ob_diceManager)
    with (instance_create_layer(0, 0, "System", ob_levelNameHUD))
        spriteAlphaTimer = 240
    if instance_exists(ob_player)
        ob_player.currentState = playerstates.normal
}
if instance_exists(ob_runbackManager)
{
    if (!ob_runbackManager.b_levelStarted)
        ob_runbackManager.b_levelStarted = 1
}
