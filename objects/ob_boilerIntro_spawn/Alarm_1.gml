if (!instance_exists(ob_player))
{
    with (instance_create_layer(x, y, "Player", ob_player))
    {
        myLayer = 2
        layerDepth = 0.5
        self.layerJump(52, 158)
        currentState = playerstates.layerjump
        horizontalSpeed = 0
        audio_stop_sound(sn_antonLayerJump)
        audio_play_sound_on(playerSoundEmit, sn_antonLayerJump, false, 100)
        audio_play_sound_on(playerSoundEmit, sn_glassBreak, false, 100)
    }
    for (var i = 0; i < 30; i += 1)
    {
        part_type_speed(global.particleGlassBreakBG, 1, 2, 0.2, 0)
        part_type_direction(global.particleGlassBreakBG, 0, 180, 0, 0)
        part_type_gravity(global.particleGlassBreakBG, 0.175, 270)
        part_particles_create(global.p_systemBG, x, y, global.particleGlassBreakBG, 1)
    }
    screenshake(1, 0, 20, 15)
    image_index = 1
    alarm[2] = 50
    alarm[3] = 50
}
