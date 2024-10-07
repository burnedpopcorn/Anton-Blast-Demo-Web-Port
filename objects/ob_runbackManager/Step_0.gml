if (wavyDistortionTimer > -1)
{
    var _curveValue = animcurve_channel_evaluate(wavyDistortionCurve, (1 - (wavyDistortionTimer / wavyDistortionTime)))
    wavy_shader_set_values((_curveValue * 10), (0.1 / _curveValue))
    wavyDistortionTimer -= 1
}
if b_runbackStarted
    screenshake(1, 1, 1, 2)
