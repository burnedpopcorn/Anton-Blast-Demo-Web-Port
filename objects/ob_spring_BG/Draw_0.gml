if (global.roomPalette == 1)
    pal_swap_set(pl_spring_boiler, 1, 0)
else
    pal_swap_set(pl_spring_boiler, 2, 0)
draw_self_gameplay_layer()
pal_swap_reset()
