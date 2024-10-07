draw_set_color(c_white)
draw_set_alpha(1)
draw_set_halign(fa_center)
if (b_textShowing == 1)
{
    if (textScale > 1)
    {
        if (textScale == 1.2)
        {
            screenshake(1, 1, 10, 20)
            audio_play_sound(sn_supportBreak, 1, false)
        }
        textScale -= 0.2
    }
    draw_sprite_ext(sp_badLuck, 0, 192, 38, textScale, textScale, 0, c_white, 1)
}
