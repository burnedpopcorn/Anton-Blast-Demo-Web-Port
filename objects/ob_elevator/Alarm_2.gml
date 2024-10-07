if (!instance_exists(ob_treasureCounter))
{
    instance_create_layer(0, 0, "System", ob_treasureCounter)
    instance_create_layer(0, 0, "System", ob_healthCounter)
    instance_create_layer(0, 0, "System", ob_treasureManager)
    instance_create_layer(0, 0, "System", ob_runbackManager)
    instance_create_layer(0, 0, "System", ob_comboCounter)
    instance_create_layer(0, 0, "System", ob_boostCounter)
    instance_create_layer(0, 0, "System", ob_detonatorManager)
    instance_create_layer(0, 0, "System", ob_diceManager)
    instance_create_layer(0, 0, "System", ob_levelNameHUD)
    if instance_exists(ob_player)
        ob_player.currentState = playerstates.normal
    screenshake(1, 0, 20, 15)
    audio_play_sound(sn_elevatorClose, 100, false)
}
if instance_exists(ob_runbackManager)
{
    if (!ob_runbackManager.b_levelStarted)
        ob_runbackManager.b_levelStarted = 1
}
