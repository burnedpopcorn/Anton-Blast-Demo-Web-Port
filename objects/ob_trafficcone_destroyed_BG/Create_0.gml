animation_init()
spriteImage = sp_trafficcone_BG
spriteScale = 1
b_touchedGround = 0
layerDepth = 1
depth = -5000
xPosition = x
yPosition = y
currentX = x
currentY = y
horizontalSpeed = 0
verticalSpeed = 0
gravitySpeed = 0.25
maxFallSpeed = 4
horizontalVelocity = 0
horizontalVelocity_subpixel = 0
verticalVelocity = 0
verticalVelocity_subpixel = 0
b_onGround = 0
b_hasGravity = 0
myBlock = -4
myLayer = 2
currentState = 0
coneSoundEmit = audio_emitter_create()
audio_emitter_gain(coneSoundEmit, 0.5)
audio_emitter_pitch(coneSoundEmit, random_range(0.9, 1.1))
audio_play_sound_on(coneSoundEmit, sn_trafficCone, false, 1)
