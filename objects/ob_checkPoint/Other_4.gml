if (global.checkpointRoom == room)
	sprite_index = sp_checkpoint_active
if (instance_exists(ob_runbackManager))
{
	if (ob_runbackManager.b_runbackStarted)
		instance_destroy()
}