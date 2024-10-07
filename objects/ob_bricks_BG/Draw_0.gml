if (global.roomPalette == 1)
    pal_swap_set(pl_brick_boiler, 1, 0)
else
    pal_swap_set(pl_brick_boiler, 2, 0)
draw_self_plus()
pal_swap_reset()
