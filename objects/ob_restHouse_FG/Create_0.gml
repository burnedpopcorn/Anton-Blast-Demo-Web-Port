event_inherited()
destructibleParticleType = global.particleRestHouse
destructibleParticleAmount = irandom_range(8, 12)
destructibleDestroy = function()
{
    audio_stop_sound(destructibleDestroySound)
    audio_sound_pitch(destructibleDestroySound, random_range(0.95, 1.05))
    audio_play_sound(destructibleDestroySound, 1, false)
    audio_stop_sound(sn_restHouse_break)
    audio_sound_pitch(sn_restHouse_break, random_range(0.95, 1.05))
    audio_play_sound(sn_restHouse_break, 1, false)
    screenshake(1, 1, 5, 5)
    for (var i = 0; i < destructibleTreasureAmount; i += 1)
    {
        with (instance_create_depth((x + random_range(-8, 8)), (y + random_range(-8, 8)), depth, destructibleTreasure))
        {
            mask_index = sp_empty
            alarm[1] = irandom_range(7, 10)
            verticalSpeed = random_range(-2, -4)
            horizontalSpeed = random_range(-4, 4)
        }
    }
    for (i = 0; i < destructibleParticleAmount; i += 1)
    {
        part_type_sprite(destructibleParticleType, sp_resthouse_particle, 0, 0, 1)
        part_type_speed(destructibleParticleType, 2, 4, 0.2, 0)
        part_type_direction(destructibleParticleType, 0, 180, 0, 0)
        part_type_gravity(destructibleParticleType, 0.35, 270)
        part_particles_create(global.p_system, (x + irandom_range(0, sprite_get_width(sprite_index))), (y + irandom_range(4, sprite_get_height(sprite_index))), destructibleParticleType, 1)
    }
    for (i = 0; i < 5; i += 1)
        instance_create_depth((x + 32), (y + 24), -1000, ob_resthouse_plank)
    b_collected = 1
    if instance_exists(ob_comboCounter)
    {
        ob_comboCounter.spriteAlphaTimer = 240
        ob_comboCounter.comboCounter += 1
        ob_comboCounter.spriteScale += 0.5
        ob_comboCounter.spriteAlpha = 1
    }
    if instance_exists(ob_treasureManager)
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
    instance_destroy(self)
}

