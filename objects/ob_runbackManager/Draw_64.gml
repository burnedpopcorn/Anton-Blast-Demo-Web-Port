draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_font(global.fontTimer)
var _timerSeconds = string((timerTime % 60))
while (string_length(_timerSeconds) < 2)
    _timerSeconds = ("0" + _timerSeconds)
if b_runbackPrepare
{
    minuteHandRotation -= 12
    hourHandRotation -= 5
    if (spriteScale > 2)
    {
        if (spriteScale == 2.2)
        {
            screenshake(1, 1, 10, 20)
            audio_play_sound(sn_supportBreak, 1, false)
        }
        spriteScale -= 0.2
    }
    draw_sprite_ext(sp_timerUI, 0, ((ob_init.viewWidth / 2) - 60), 32, (spriteScale / 2), (spriteScale / 2), 0, c_white, 1)
    draw_text_transformed((ob_init.viewWidth / 2), 2, ((string(floor((timerTime / 60))) + ":") + _timerSeconds), spriteScale, spriteScale, 0)
}
