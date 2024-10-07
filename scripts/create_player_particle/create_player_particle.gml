function create_player_particle(trailDelay = 4)
{
    playerTrails -= 1
    if (playerTrails <= 0)
    {
        var playerParticle = instance_create_depth(x, y, (depth + 1), ob_playerParticle)
        playerParticle.spriteFacing = spriteFacing
        playerParticle.myLayer = myLayer
        playerParticle.spriteScale = spriteScale
		if (currentState == playerstates.clutch)
			playerParticle.alarm[2] = -1
        playerTrails = trailDelay
    }
}

