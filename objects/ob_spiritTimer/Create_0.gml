event_inherited()
image_speed = 1
xPosition = x
if instance_exists(ob_runbackManager)
{
    if ob_runbackManager.b_runbackStarted
    {
        b_activated = 1
        alarm[0] = 1
    }
    else
        b_activated = 0
}
else
    b_activated = 0
timerSoundEmit = audio_emitter_create()
audio_emitter_gain(timerSoundEmit, 0.8)
spinningAnimation = 0
minuteHandRotation = 0
hourHandRotation = 0
spriteAlpha = 0
spriteAlphaTimer = 0
