if (ob_globalMenuInput.start)
{
	if (instance_exists(ob_debugconsole))
	{
		if (ob_debugconsole.active)
			exit;
	}
    if (!b_paused)
    {
        audio_pause_all()
        gamepad_set_vibration(ob_globalMenuInput.lastDevice, 0, 0)
        b_paused = 1
        with (all)
        {
            switch object_index
            {
                case ob_pause_handler:
                case ob_globalMenuInput:
				case ob_debugconsole:
                    break
                default:
                    instance_deactivate_object(id)
                    break
            }

        }
        audio_play_sound(sn_pauseEnd, 1, false)
        instance_create(ob_pauseMenu)
    }
    else
        self.unpause()
}
