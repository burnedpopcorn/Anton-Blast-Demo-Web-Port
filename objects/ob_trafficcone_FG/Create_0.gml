event_inherited()
animation_init()
spriteImage = sp_trafficcone_FG
spriteScale = 1
layerDepth = 1
xPosition = x
yPosition = y
currentX = x
currentY = y
myBlock = -4
myLayer = 1
currentState = 0
coneSoundEmit = audio_emitter_create()
audio_emitter_gain(coneSoundEmit, 0.8)
destructibleDestroy = function()
{
    if instance_exists(ob_player)
    {
        var _flyDir = 1
        if (bbox_left < ob_player.bbox_left)
            _flyDir = -1
        screenshake(1, 1, 5, 5)
        b_collected = 1
        if instance_exists(ob_comboCounter)
        {
            ob_comboCounter.spriteAlphaTimer = 240
            ob_comboCounter.comboCounter += 1
            ob_comboCounter.spriteScale += 0.5
            ob_comboCounter.spriteAlpha = 1
        }
        with (instance_create_depth(x, y, depth, ob_trafficcone_destroyed))
        {
            horizontalSpeed = (random_range(4, 6) * _flyDir)
            verticalSpeed = random_range(-4, -6)
        }
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
        instance_destroy()
    }
}

