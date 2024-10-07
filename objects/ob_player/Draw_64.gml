if b_virtualController
{
    var virtualControllerX = 16
    var virtualControllerY = (ob_init.viewHeight - 23)
    draw_sprite(sp_virtualController, 0, virtualControllerX, virtualControllerY)
    if leftKey
        draw_sprite(sp_virtualController_DpadLeft, 0, virtualControllerX, virtualControllerY)
    if rightKey
        draw_sprite(sp_virtualController_DpadRight, 0, virtualControllerX, virtualControllerY)
    if upKey
        draw_sprite(sp_virtualController_DpadUp, 0, virtualControllerX, virtualControllerY)
    if downKey
        draw_sprite(sp_virtualController_DpadDown, 0, virtualControllerX, virtualControllerY)
    if jumpKeyHeld
        draw_sprite(sp_virtualController_Face1, 0, virtualControllerX, virtualControllerY)
    if attackKeyHeld
        draw_sprite(sp_virtualController_Face2, 0, virtualControllerX, virtualControllerY)
    if optionKey
        draw_sprite(sp_virtualController_Face3, 0, virtualControllerX, virtualControllerY)
}
draw_set_halign(fa_left)
draw_set_font(global.fontMain)
draw_set_color(c_white)
