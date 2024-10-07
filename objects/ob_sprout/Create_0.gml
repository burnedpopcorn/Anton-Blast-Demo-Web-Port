pullUp = function()
{
    instance_create_depth(x, y, depth, ob_beet)
    audio_play_sound(sn_pullSprout, 1, false)
    audio_play_sound(sn_pullSprout2, 1, false)
    ob_healthCounter.spriteAlphaTimer = 240
    instance_destroy(self)
}

animation_init()
spriteImage = sprite_index
spriteFrame = irandom_range(0, 4)
myLayer = 1
xPosition = x
yPosition = y
