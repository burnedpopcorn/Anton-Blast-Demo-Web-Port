draw_self_gameplay_layer()
if spinningAnimation
{
    draw_sprite_ext(sp_spiritTimerHourHand, 0, (x - 1), (y - 12), 1, 1, hourHandRotation, c_white, 1)
    draw_sprite_ext(sp_spiritTimerMinuteHand, 0, (x - 1), (y - 12), 1, 1, minuteHandRotation, c_white, 1)
}
