audio_emitter_position(wreckingBallSoundEmit, x, y, 0)
currentX = x
var _cyclePosition = (cycleTimer / cycleDuration)
var _curveValue = animcurve_channel_evaluate(swingCurve, (2 * (_cyclePosition > 0.5 ? (1 - _cyclePosition) : _cyclePosition)))
y = (startY - abs((_curveValue * swingHeight)))
spriteScale = map(_curveValue, -1, 1, 1.5, 0.5)
if ((instance_exists(ob_runbackManager) && (!ob_runbackManager.b_runbackEnded)) || (!instance_exists(ob_runbackManager)))
{
    if (abs(_curveValue) < collisionBand)
    {
        if (!playedSound)
        {
            part_particles_create(global.p_system, x, (y + 35), global.particleLandingDust, 1)
            audio_emitter_position(wreckingBallSoundEmit, x, y, 0)
            if (_cyclePosition < 0.5)
                audio_play_sound_on(wreckingBallSoundEmit, sn_wreckingBallForward, false, 1)
            else
                audio_play_sound_on(wreckingBallSoundEmit, sn_wreckingBallBackward, false, 1)
            playedSound = 1
        }
        var _meetingPlayer = instance_place(x, y, ob_player)
        if (_meetingPlayer != noone && _meetingPlayer.myLayer == myLayer && _meetingPlayer.invincibilityTimer == 0)
        {
            screenshake(1, 1, 30, 30)
            audio_play_sound_on(wreckingBallSoundEmit, sn_smack, false, 100)
            _meetingPlayer.playerGetHurt()
        }
    }
    else
        playedSound = 0
    if (_curveValue < 0)
        depth = foregroundDepth
    else
        depth = backgroundDepth
    cycleTimer = ((cycleTimer + 1) % cycleDuration)
    with (ob_player)
    {
        var _eyeX = other.x
        if (xPosition > (_eyeX + 33))
            other.eyeFrame = 4
        else if (xPosition > median((_eyeX + 32), (_eyeX + 17)) && xPosition < (_eyeX + 32))
            other.eyeFrame = 3
        else if (xPosition >= median((_eyeX - 16), (_eyeX + 16)))
            other.eyeFrame = 2
        else if (xPosition < median((_eyeX - 32), (_eyeX - 17)) && xPosition > (_eyeX - 32))
            other.eyeFrame = 1
        else if (xPosition < (_eyeX - 33))
            other.eyeFrame = 0
    }
}
