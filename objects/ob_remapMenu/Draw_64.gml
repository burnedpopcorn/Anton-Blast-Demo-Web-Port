if is_undefined(currentRemapKey)
    event_inherited()
else
{
    draw_set_alignment(1, 1)
    draw_set_color(c_white)
    var _drawPos = backRect.getCenter()
    var _inputsString = ""
    var _cancelString = (currentPage == keysPage ? "Escape" : "Start or Select")
    draw_text(_drawPos.x, _drawPos.y, (((ds_list_find_value(currentPage, selectedItemIndex).displayText + "\nEnter new input!\n") + _cancelString) + " to cancel."))
}
