curX = x
//if instance_exists(ob_player)
//{
//    spriteImage = ob_player.spriteImage
//    if b_chasing
//    {
//        moveSpeed += 1
//        move_towards_point(ob_player.x, ob_player.y, moveSpeed)
//    }
//}
if (global.roomPalette == 3)
    pal_swap_set(sp_anton_palette_VB, 1, 0)
else
    pal_swap_set(sp_anton_chargepalette, palette, 0)
draw_self_plus()
pal_swap_reset()
