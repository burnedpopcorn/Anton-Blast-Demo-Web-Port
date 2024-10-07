if (!b_broken)
{
    if collision_rectangle(0, y, room_width, y + 40, ob_player, false, true)
    {
        for (var i = 0; i < 30; i += 1)
        {
            part_type_speed(global.particleGlassBreak, 2, 4, 0.2, 0)
            part_type_direction(global.particleGlassBreak, 0, 360, 0, 0)
            part_type_gravity(global.particleGlassBreak, 0.3, 270)
            part_particles_create(global.p_system, x, y, global.particleGlassBreak, 1)
        }
        audio_stop_sound(sn_glassBreak)
        audio_sound_pitch(sn_glassBreak, random_range(0.9, 1.15))
        audio_play_sound(sn_glassBreak, 1, false)
        screenshake(1, 0, 20, 15)
        image_index = 1
        b_broken = 1
    }
}
