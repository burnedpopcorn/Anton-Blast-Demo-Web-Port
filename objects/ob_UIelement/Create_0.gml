var _newDepth = -10
with (ob_UIelement)
{
    if (depth <= _newDepth)
        _newDepth = (depth - 1)
}
depth = _newDepth
with (ob_UIelement)
{
    if alwaysOnTop
        depth = (_newDepth - 1)
}
screenW = DISPLAY_WIDTH
screenH = DISPLAY_HEIGHT
creator = undefined
