function display_set_fullscreen()
{
    display_set_borderless(1)
    var _newResolution = new vector2()
    _newResolution.x = nearest_multiple(display_get_width(), 16)
    _newResolution.y = round((_newResolution.x * 0.5625))
    if (_newResolution.y > display_get_height())
    {
        _newResolution.y = nearest_multiple(display_get_height(), 9)
        _newResolution.x = round((_newResolution.y * 1.7777777777777777))
    }
    window_resize(_newResolution)
    function_execute(display_set_borderless, 0, 10)
    function_execute(window_resize, _newResolution, 11)
    function_execute(display_set_borderless, 1, 20)
    function_execute(window_set_fullscreen, 1, 21)
}

function display_set_windowed_size(argument0)
{
    display_set_borderless(1)
    window_resize(argument0)
    function_execute(display_set_borderless, 0, 10)
    function_execute(window_resize, argument0, 11)
    function_execute(function()
    {
        window_center()
    }
, undefined, 12)
}

function room_to_gui_pos(argument0)
{
    var _guiSizeRatio = (display_get_gui_width() / 384)
    return new vector2(((argument0.x - camera_get_view_x(view_camera[0])) * _guiSizeRatio), ((argument0.y - camera_get_view_y(view_camera[0])) * _guiSizeRatio));
}

function display_set_borderless(argument0)
{
    if argument0
        self.otb_set_borderless()
    else
        self.otb_set_windowed()
}

function window_resize(argument0)
{
    window_set_size(argument0.x, argument0.y)
}

