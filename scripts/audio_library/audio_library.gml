function audio_play_sound_duration(argument0, argument1, argument2 = 0)
{
    var _soundInst = audio_play_sound(argument0, argument2, true)
    function_execute(audio_stop_sound_instance, [_soundInst, argument0], argument1)
    return _soundInst;
}

function audio_stop_sound_instance(argument0, argument1)
{
    if (is_undefined(argument1) || audio_get_name(argument0) == audio_get_name(argument1))
        audio_stop_sound(argument0)
}

function audio_play(argument0, argument1, argument2)
{
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = 0
    return audio_play_sound(argument0, argument1, argument2);
}

