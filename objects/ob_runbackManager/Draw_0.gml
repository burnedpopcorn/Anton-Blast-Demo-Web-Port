var _frameTime = ((timerTime * 60) + alarm[0])
var _fireRatio = max(0, (_frameTime / fireTime))
if ((b_runbackStarted || b_runbackEnded) && _fireRatio < 1)
{
    var _tileSize = sprite_get_width(sp_fireloop)
    var _maxHeight = (room_height + _tileSize)
    var _targetHeight = (_maxHeight - (_maxHeight * _fireRatio))
    if (_fireRatio > 0)
        var _fireHeight = wave(0, _targetHeight, 225, 0.5, _frameTime)
    else
        _fireHeight = loop(_maxHeight, (_maxHeight + _tileSize), 0.5)
    for (var i = 0; i <= ceil((room_width / _tileSize)); i++)
    {
        for (var j = 0; j <= ceil(((_maxHeight * 2) / _tileSize)); j++)
        {
            var _sprite = (j == 0 ? sp_firetop : sp_fireloop)
            draw_sprite(_sprite, sprite_get_current_subimage(_sprite), (_tileSize * i), ((room_height - _fireHeight) + (_tileSize * j)))
        }
    }
}
