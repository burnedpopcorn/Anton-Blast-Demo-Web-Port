swingHeight = 64
collisionBand = 0.2
myLayer = 1
startY = y
cycleTimer = timerOffset
swingCurve = animcurve_get_channel(ac_wreckingBall, "curve1")
animation_init()
spriteImage = sprite_index
wreckingBallSoundEmit = audio_emitter_create()
playedSound = 0
foregroundDepth = (layer_get_depth("InstancesFG") - 200)
backgroundDepth = (layer_get_depth("Player") + 50)
eyeFrame = 0
