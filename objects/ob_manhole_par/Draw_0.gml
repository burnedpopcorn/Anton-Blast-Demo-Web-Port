if b_bonusManhole
    pal_swap_set(pl_manhole, 1, 0)
else
    pal_swap_set(pl_manhole, 0, 0)
draw_self_gameplay_layer()
pal_swap_reset()
