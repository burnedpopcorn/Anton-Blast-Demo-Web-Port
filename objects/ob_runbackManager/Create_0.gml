wavyBackgroundStart = function()
{
    var _layers = layer_get_all()
    for (var i = 0; i < array_length(_layers); i++)
    {
        if (string_count("Background", layer_get_name(_layers[i])) > 0)
            wavy_shader_start(_layers[i])
    }
}

runbackStart = function()
{
    alarm[0] = 60
    alarm[1] = 120
    alarm[2] = 60
    self.wavyBackgroundStart()
    wavyDistortionTimer = wavyDistortionTime
    b_runbackPushed = 1
}

runbackStop = function()
{
    alarm[0] = -1
    alarm[1] = -1
    alarm[2] = -1
    b_runbackPushed = 0
    b_runbackPrepare = 0
    b_runbackStarted = 0
    b_runbackEnded = 1
}

b_levelStarted = 0
b_runbackPushed = 0
b_runbackPrepare = 0
b_runbackStarted = 0
b_runbackEnded = 0
spriteScale = 4

runbackTime = 241
// Runback time limit in seconds
switch room
{
	case rm_BoilerIntroI:
		runbackTime = 241
		break
	case rm_testStage5:
		runbackTime = 16
		break
	case rm_testStage2:
		runbackTime = 7
		break
}

timerTime = runbackTime
wavyDistortionTimer = -1
wavyDistortionTime = 70
wavyDistortionCurve = animcurve_get_channel(ac_wavyDistortion, "curve1")
minuteHandRotation = 0
hourHandRotation = 0
fireTime = 240
depth = -150
