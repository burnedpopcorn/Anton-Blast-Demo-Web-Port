transitioning = 0
alarm[0] = 240
beginTransition = function()
{
    transitioning = 1
    with (instance_create_depth(x, y, (depth - 300), ob_transitionPinhole))
        onMidTransition = other.transitionExecute
}

transitionExecute = function()
{
	audio_group_set_gain(ag_sounds, settings().sfxVolume, 0)
	room_goto_next()
}
if (room == rm_summitsphere)
{
	alarm[0] = 50
	audio_play_sound(sn_summitScream, 1, false)
}