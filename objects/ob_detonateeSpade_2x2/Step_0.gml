audio_emitter_position(detonateeSoundEmit, (x + 16), (y + 16), 0)
if instance_exists(ob_detonatorManager)
{
    if ob_detonatorManager.b_spadeSet
    {
        if (!b_activated)
        {
            explosiveFuseTimer = explosiveFuseLength
            b_activated = 1
        }
    }
    if b_activated
    {
        explosiveFuseTimer -= 1
        if (explosiveFuseTimer <= 0)
        {
            instance_create_depth((x + 16), (y + 16), -100000, ob_explosion)
            screenshake(1, 1, 15, 25)
            audio_stop_sound(sn_explosiveCrate)
            audio_emitter_pitch(detonateeSoundEmit, random_range(0.9, 1.1))
            audio_play_sound_on(detonateeSoundEmit, sn_explosiveCrate, false, 1)
            instance_destroy()
        }
    }
}
