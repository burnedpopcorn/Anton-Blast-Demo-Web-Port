function collision_check(argument0, argument1, argument2)
{
    if (argument2 == undefined)
        argument2 = ob_player
    var _checkPos = new vector2((x + argument1.x), (y + argument1.y))
    var _placeMeeting = (argument2 ? place_meeting_tiles : place_meeting)
    if (!argument2)
    {
        var _collisionInst = instance_place(_checkPos.x, _checkPos.y, argument0)
        if (_collisionInst == noone)
            return 0;
        if (variable_instance_exists(_collisionInst, "noCollision") && _collisionInst.noCollision)
            return 0;
    }
    else if (!(self._placeMeeting(_checkPos.x, _checkPos.y, argument0)))
        return 0;
    var _hCol = 0
    var _vCol = 0
    if self._placeMeeting(_checkPos.x, y, argument0)
    {
        var i = 0
        while ((!(self._placeMeeting((x + sign(argument1.x)), y, argument0))) && i < argument1.x)
        {
            x += sign(argument1.x)
            i++
        }
        argument1.x = 0
        _hCol = 1
    }
    if self._placeMeeting(x, _checkPos.y, argument0)
    {
        i = 0
        while ((!(self._placeMeeting(x, (y + sign(argument1.y)), argument0))) && i < argument1.y)
        {
            y += sign(argument1.y)
            i++
        }
        argument1.y = 0
        _vCol = 1
    }
    if ((!_hCol) && (!_vCol))
        argument1.set(0, 0)
    return 1;
}

function instance_get_bbox_size(argument0)
{
    return new vector2(((argument0.bbox_right - argument0.bbox_left) + 1), ((argument0.bbox_bottom - argument0.bbox_top) + 1));
}

function instance_get_bbox_center(argument0)
{
    var _pos = instance_get_bbox_size(argument0)
    _pos.set(((argument0.bbox_left + (_pos.x / 2)) - 0.5), ((argument0.bbox_top + (_pos.y / 2)) - 0.5))
    return _pos;
}

function place_meeting_tiles(argument0, argument1, argument2)
{
    var _startPos = new vector2(x, y)
    x = argument0
    y = argument1
    var _bboxSize = instance_get_bbox_size(self)
    var _fidelity = new vector2(tilemap_get_tile_width(argument2), tilemap_get_tile_height(argument2))
    var _stopPos = new vector2((_bboxSize.x + _fidelity.x), (_bboxSize.y + _fidelity.y))
    var _collisionFound = 0
    var i = 0
    while (i < _stopPos.x)
    {
        var _checkX = (bbox_left + clamp(i, 0, _bboxSize.x))
        var j = 0
        while (j < _stopPos.y)
        {
            var _checkY = (bbox_top + clamp(j, 0, _bboxSize.y))
            _collisionFound = tilemap_get_at_pixel(argument2, _checkX, _checkY) > 0
            if _collisionFound
                break
            else
                j += _fidelity.y
        }
        if _collisionFound
            break
        else
            i += _fidelity.x
    }
    x = _startPos.x
    y = _startPos.y
    return _collisionFound;
}

function shape_in_line(argument0, argument1, argument2, argument3)
{
    if (argument3 == undefined)
        argument3 = 1
    var _dir = vector2_point_direction(argument1, argument2)
    _dir.set(_dir.y, (-_dir.x))
    _dir.multiply((argument3 / 2))
    var _x1 = (argument1.x - _dir.x)
    var _y1 = (argument1.y - _dir.y)
    var _x2 = (argument1.x + _dir.x)
    var _y2 = (argument1.y + _dir.y)
    var _x3 = (argument2.x - _dir.x)
    var _y3 = (argument2.y - _dir.y)
    var _x4 = (argument2.x + _dir.x)
    var _y4 = (argument2.y + _dir.y)
    switch argument0.getConstructor()
    {
        case rect:
            return (rectangle_in_triangle(argument0.x, argument0.y, argument0.getRight(), argument0.getBottom(), _x1, _y1, _x2, _y2, _x3, _y3) > 0 || rectangle_in_triangle(argument0.x, argument0.y, argument0.getRight(), argument0.getBottom(), _x3, _y3, _x4, _y4, _x2, _y2) > 0);
        case vector2:
            return (point_in_triangle(argument0.x, argument0.y, _x1, _y1, _x2, _y2, _x3, _y3) || point_in_triangle(argument0.x, argument0.y, _x3, _y3, _x4, _y4, _x2, _y2));
    }

}

