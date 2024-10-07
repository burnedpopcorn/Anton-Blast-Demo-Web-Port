function playerState_ReactCannon()
{
    assign_layer_mask(sp_playerMaskFG, sp_playerMaskBG)
    self.updateHitbox()
    horizontalSpeed = 0
    if (!b_warping)
    {
        if (!b_fallingCannon)
            verticalSpeed = approach(verticalSpeed, -10, 3)
        else
            verticalSpeed += gravitySpeed
        if (verticalSpeed > 6 && verticalSpeed < 7)
        {
            if (!audio_is_playing(sn_falling))
                audio_play_sound(sn_falling, 1, false)
        }
        if (verticalSpeed > 10)
            verticalSpeed = 10
        if place_meeting(x, y, ob_cannon_gravityFlag)
        {
            if (!b_fallingCannon)
            {
                global.roomSong = 4
                b_fallingCannon = 1
            }
        }
    }
    if (place_meeting(x, (y - 15), myBlock) || place_meeting(x, (y + verticalSpeed), myBlock) || (verticalSpeed > 0 && place_meeting(x, (y + verticalSpeed), myPassthrough)))
    {
        for (var i = 0; i < 30; i += 1)
        {
            part_type_sprite(global.particleConcrete, sp_concrete_gibs, 0, 0, 1)
            part_type_speed(global.particleConcrete, 2, 4, 0.2, 0)
            part_type_direction(global.particleConcrete, 0, 180, 0, 0)
            part_type_gravity(global.particleConcrete, 0.35, 270)
            part_particles_create(global.p_system, (x + irandom_range(-8, 8)), (y + irandom_range(-4, -32)), global.particleConcrete, 1)
        }
        screenshake(1, 1, 10, 20)
        audio_play_sound(sn_antonConcreteBreak, 1, false)
        b_fallingCannon = 0
        currentState = playerstates.normal
    }
}

