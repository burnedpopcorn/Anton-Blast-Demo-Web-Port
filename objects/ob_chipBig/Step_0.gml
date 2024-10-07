event_inherited()
audio_emitter_position(chipSoundEmit, xPosition, y, 0)
spriteFrameSpeed -= 0.05
if (!b_collected)
{
    if (horizontalSpeed > 0)
        horizontalSpeed -= 0.025
    else if (horizontalSpeed < 0)
        horizontalSpeed += 0.025
    if b_onGround
    {
        audio_emitter_pitch(chipSoundEmit, random_range(0.9, 1.2))
        audio_play_sound_on(chipSoundEmit, coinBounceSnd, false, 1)
        spriteFrameSpeed = 0.5
        horizontalSpeed = choose(1, 0.5, -1, -0.5, 1.5, -1.5)
        verticalSpeed = choose(-2, -3, -2.5)
    }
}
else if b_collected
{
}
