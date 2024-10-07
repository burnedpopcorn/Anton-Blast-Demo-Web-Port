function sq_elevatorEnd_Moment()
{
    with (ob_runbackManager)
        wavyDistortionTimer = wavyDistortionTime
    screenshake(1, 1, 30, 40)
}

function sq_elevatorEnd_Moment_1()
{
    screenshake(1, 1, 15, 20)
}

function sq_elevatorEnd_Moment_2()
{
    screenshake(1, 1, 190, 15)
}

function sq_elevatorEnd_Moment_3()
{
	audio_stop_sound(sn_explosiveCrate)
    audio_play_sound(mu_elevator, 100, true)
}

function sq_elevatorEnd_Moment_5()
{
    ob_elevator.y = ob_elevator.yPosition
}

