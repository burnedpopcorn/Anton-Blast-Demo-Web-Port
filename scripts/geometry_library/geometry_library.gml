function grid_position(argument0, argument1, argument2, argument3, argument4)
{
    if (!(argument0.contains(argument1.x, argument1.y)))
        return undefined;
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = 0
    var _tileWidth = (argument2 + argument3)
    var _xPos = ((argument1.x - argument0.x) / _tileWidth)
    var _yPos = ((argument1.y - argument0.y) / _tileWidth)
    var _nonOffsetPortion = (1 - (argument3 / _tileWidth))
    var _rowSize = floor((((argument0.width / _tileWidth) + 1) - _nonOffsetPortion))
    if (frac(_xPos) < _nonOffsetPortion && frac(_yPos) < _nonOffsetPortion && _xPos < _rowSize)
    {
        _xPos = floor(_xPos)
        _yPos = floor(_yPos)
        if argument4
            return (_xPos + (_yPos * _rowSize));
        return new vector2(_xPos, _yPos);
    }
    return undefined;
}

