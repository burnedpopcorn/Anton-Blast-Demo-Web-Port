if (endingSequence == -1)
{
    pal_swap_set(sp_nova_palette, loop(0, 11, 1200, 0, bgPaletteTime), false)
    draw_sprite_ext(sp_nova_bg, 0, x, (y - (sprite_height / 2)), 1, 1, bgRotation, c_white, 1)
    pal_swap_reset()
    y = (yPosition + wave(-6, 6, 4.3, 0, (current_time / 1000)))
}
draw_self()
