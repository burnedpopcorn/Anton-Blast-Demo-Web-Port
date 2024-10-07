function game_reset(argument0)
{
    if (argument0 == undefined)
        argument0 = rm_mainMenu
    instance_destroy_multiple(ob_treasureManager, ob_treasureCounter, ob_healthCounter, ob_runbackManager, ob_comboCounter, ob_boostCounter, ob_detonatorManager, ob_diceManager, ob_levelNameHUD, ob_player, ob_treasure_par)
    ob_conservedObjectManager.instanceData = {}
    ob_timeAttackManager.timerActive = 0
    audio_stop_all()
	if (argument0 == rm_mainMenu)
		global.restartRoom = -4
	global.checkpointRoom = -4
	global.checkpointX = 0
	global.checkpointY = 0
    room_goto(argument0)
}

function checkpoint_reset(pinhole = false)
{
	if (global.checkpointRoom != -4)
	{
		var checkpointtransition = function()
		{
			with (ob_runbackManager)
		    {
				self.runbackStop()
				b_runbackEnded = false
				timerTime = runbackTime
		    }
		    with (ob_player)
		    {
		        x = global.checkpointX
		        y = global.checkpointY
		        currentState = playerstates.normal
		        playerHealth = playerHealthMax
		        myLayer = 1
		    }
			with (ob_treasure_par)
			{
				if (b_collected)
					instance_destroy()
			}
			instance_destroy(ob_treasureManager)
		    ob_treasureCounter.actualScore = 0
			ob_conservedObjectManager.instanceData = {}
			instance_create_layer(0, 0, "System", ob_treasureManager)
			audio_stop_all()
		    room_goto(global.checkpointRoom)
		}
		if (pinhole)
		{
		    with (instance_create_layer(192, 108, "System", ob_transitionPinhole))
		        onMidTransition = checkpointtransition
		}
		else
			checkpointtransition()
	}
	else
	    game_reset(global.restartRoom)
}