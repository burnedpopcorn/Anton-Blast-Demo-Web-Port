function draw_sprite_nineslice(argument0, argument1, argument2, argument3)
{
    argument1 = new rect(argument1.x, argument1.y, argument1.width, argument1.height)
    if (argument2 == undefined)
        argument2 = ob_player
    if (argument3 == undefined)
        argument3 = 16777215
    var _spriteWidth = sprite_get_width(argument0)
    var _subSize = (_spriteWidth / 3)
    var _currentSubimage = sprite_get_current_subimage(argument0)
    if argument2
    {
        var _tileAmount = new vector2(round((argument1.width / _subSize)), round((argument1.height / _subSize)))
        argument1.resize((_tileAmount.x * _subSize), (_tileAmount.y * _subSize))
        _tileAmount.add(-2, -2)
    }
    var _spriteRect = new rect(0, 0, (_spriteWidth - _subSize), (_spriteWidth - _subSize))
    var _centerSize = new vector2((argument1.width - (_subSize * 2)), (argument1.height - (_subSize * 2)))
    argument1.add((-_subSize), (-_subSize))
    for (var i = 0; i < 4; i++)
    {
        var _spritePos = _spriteRect.getCorner(i)
        var _drawPos = argument1.getCorner(i)
        draw_sprite_part_ext(argument0, _currentSubimage, _spritePos.x, _spritePos.y, _subSize, _subSize, _drawPos.x, _drawPos.y, 1, 1, argument3, 1)
    }
    if argument2
    {
        for (i = 0; i < 2; i++)
        {
            var _spriteY = (_spriteRect.height * i)
            var _drawY = (argument1.y + (argument1.height * i))
            var _drawOffset = 0
            repeat _tileAmount.x
            {
                draw_sprite_part_ext(argument0, _currentSubimage, _subSize, _spriteY, _subSize, _subSize, ((argument1.x + _subSize) + _drawOffset), _drawY, 1, 1, argument3, 1)
                _drawOffset += _subSize
            }
            var _spriteX = (_spriteRect.width * i)
            var _drawX = (argument1.x + (argument1.width * i))
            _drawOffset = 0
            repeat _tileAmount.y
            {
                draw_sprite_part_ext(argument0, _currentSubimage, _spriteX, _subSize, _subSize, _subSize, _drawX, ((argument1.y + _subSize) + _drawOffset), 1, 1, argument3, 1)
                _drawOffset += _subSize
            }
        }
        for (i = 0; i < _tileAmount.x; i++)
        {
            for (var j = 0; j < _tileAmount.y; j++)
                draw_sprite_part_ext(argument0, _currentSubimage, _subSize, _subSize, _subSize, _subSize, (argument1.x + (_subSize * (i + 1))), (argument1.y + (_subSize * (j + 1))), 1, 1, argument3, 1)
        }
    }
    else
    {
        for (i = 0; i < 2; i++)
        {
            _spriteY = (_spriteRect.height * i)
            _drawY = (argument1.y + (argument1.height * i))
            draw_sprite_part_ext(argument0, _currentSubimage, _subSize, _spriteY, _subSize, _subSize, (argument1.x + _subSize), _drawY, (_centerSize.x / _subSize), 1, argument3, 1)
            _spriteX = (_spriteRect.width * i)
            _drawX = (argument1.x + (argument1.width * i))
            draw_sprite_part_ext(argument0, _currentSubimage, _spriteX, _subSize, _subSize, _subSize, _drawX, (argument1.y + _subSize), 1, (_centerSize.y / _subSize), argument3, 1)
        }
        draw_sprite_part_ext(argument0, _currentSubimage, _subSize, _subSize, _subSize, _subSize, (argument1.x + _subSize), (argument1.y + _subSize), (_centerSize.x / _subSize), (_centerSize.y / _subSize), argument3, 1)
    }
}

function draw_sprite_tiled_rect(argument0, argument1, argument2, argument3, argument4, argument5)
{
    var _tileScale = new vector2(1, 1)
    if (!is_undefined(argument3))
        _tileScale.set((argument3.x / sprite_get_width(argument0)), (argument3.y / sprite_get_height(argument0)))
    if (argument4 == undefined)
        argument4 = 16777215
    if (argument5 == undefined)
        argument5 = 0x000001
    var _surf = surface_create(nearest_higher_power_of_2(argument2.width), nearest_higher_power_of_2(argument2.height))
    surface_default_setup(_surf)
    draw_sprite_tiled_ext(argument0, argument1, 0, 0, _tileScale.x, _tileScale.y, c_white, 1)
    gpu_set_blendmode(bm_normal)
    surface_reset_target()
    draw_surface_part_ext(_surf, 0, 0, argument2.width, argument2.height, argument2.x, argument2.y, 1, 1, argument4, argument5)
    surface_free(_surf)
}

function draw_sprite_no_offset(argument0, argument1, argument2, argument3, argument4, argument5, argument6)
{
    if (argument2 == undefined)
        argument2 = sprite_get_current_subimage(argument0)
    if (argument3 == undefined)
        argument3 = 1
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = c_white
    if (argument6 == undefined)
        argument6 = 1
    draw_sprite_part_ext(argument0, argument2, 0, 0, sprite_get_width(argument0), sprite_get_height(argument0), argument1.x, argument1.y, argument3, argument4, argument5, argument6)
}

