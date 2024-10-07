draw_sprite_stretched(backSprite, sprite_get_current_subimage(backSprite), backRect.x, backRect.y, backRect.width, backRect.height)
draw_set_alignment(textAlignment, 0)
var _drawRect = new rect(-1, (backRect.y + ninesliceInfo.top), 0, 0)
if (textOutline > 0)
{
    var _outlineBaseSurf = surface_create(384, 216)
    surface_set_target(_outlineBaseSurf)
    draw_clear_alpha(c_black, 0)
}
for (var i = 0; i < ds_list_size(currentPage); i++)
{
    draw_set_color(textColor)
    var _currentItem = ds_list_find_value(currentPage, i)
    draw_set_font(_currentItem.myFont)
    _drawRect.width = _currentItem.size.x
    _drawRect.height = _currentItem.size.y
    switch textAlignment
    {
        case 0:
            _drawRect.x = (backRect.x + ninesliceInfo.left)
            break
        case 1:
            _drawRect.x = (backRect.getCenter().x - (_drawRect.width / 2))
            break
        case 2:
            _drawRect.x = ((backRect.getRight() - ninesliceInfo.right) - _drawRect.width)
            break
    }

    if (i == selectedItemIndex)
    {
		if (_currentItem.myFont != global.fontLevelName)
			draw_sprite(sp_menuCursor, 0, (_drawRect.x - cursorOffset), (_drawRect.y + (string_height("M") / 2)))
        draw_set_color(selectedTextColor)
    }
	if (!_currentItem.interactable)
		draw_set_color(selectedTextColor)
    _currentItem.draw(_drawRect)
    _drawRect.y += _drawRect.height
}
if (textOutline > 0)
{
    surface_reset_target()
    gpu_set_blendmode(bm_normal)
    var _outlineSurf = surface_outline_create(_outlineBaseSurf, textOutline, 1)
    draw_surface(_outlineBaseSurf, 0, 0)
    pal_swap_set(outlinePalette, 1, 0)
    draw_surface(_outlineSurf, 0, 0)
    pal_swap_reset()
    surface_free(_outlineSurf)
    surface_free(_outlineBaseSurf)
}
