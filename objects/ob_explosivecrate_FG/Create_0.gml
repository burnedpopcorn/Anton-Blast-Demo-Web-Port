event_inherited()
animation_init()
crateSoundEmit = audio_emitter_create()
palette = 0
destructibleDestroy = function()
{
    audio_stop_sound(destructibleDestroySound)
    audio_sound_pitch(destructibleDestroySound, random_range(0.95, 1.05))
    audio_play_sound_on(crateSoundEmit, destructibleDestroySound, false, 1)
    audio_stop_sound(sn_explosiveCrate2)
    audio_sound_pitch(sn_explosiveCrate2, random_range(0.8, 1.2))
    audio_play_sound(sn_explosiveCrate2, 1, false)
    screenshake(1, 1, 15, 15)
    instance_create_depth((x + 8), (y + 8), -10000, ob_explosivecrate_explosion)
    for (var i = 0; i < destructibleParticleAmount; i += 1)
    {
        part_type_sprite(destructibleParticleType, destructibleParticleSprite, 0, 0, 1)
        part_type_speed(destructibleParticleType, 2, 4, 0.2, 0)
        part_type_direction(destructibleParticleType, 0, 180, 0, 0)
        part_type_gravity(destructibleParticleType, 0.35, 270)
        part_particles_create(global.p_system, (x + irandom_range(0, 8)), (y + irandom_range(4, 12)), destructibleParticleType, 1)
    }
    b_collected = 1
    ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
    instance_destroy(self)
}

alarm[0] = irandom_range(20, 120)
spriteImage = sprite_index
spriteFrame = irandom_range(0, 3)
spriteFrameSpeed = 0
destructibleDestroySound = sn_crateBreak
destructibleTreasure = ob_chip
destructibleTreasureAmount = irandom_range(1, 5)
destructibleParticleAmount = 20
