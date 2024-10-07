event_inherited()
animation_init()
spriteImage = sprite_index
spriteRotation = 0
horizontalSpeed = 0
verticalSpeed = 0
gravitySpeed = 0.25
b_hit = 0
b_activated = 0
rocketDirection = 0
onHitboxCollision = function(argument0)
{
    if (!b_hit)
    {
        if (bbox_left < ob_player.bbox_left)
        {
            spriteRotation = 1
            rocketDirection = -1
        }
        else
        {
            spriteRotation = 359
            rocketDirection = 1
        }
        y -= 13
        argument0.myPlayer.playerClutchHit()
        b_hit = 1
    }
}

