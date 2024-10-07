switch global.roomPalette
{
    case 1:
        playerPalette = sp_anton_palette
        break
    case 2:
        playerPalette = sp_anton_palette_sewer
        break
    case 3:
        playerPalette = sp_anton_palette_VB
        break
}

if (currentState == playerstates.layerjump)
{
    var _scale = map(layerJumpTimer, 0, layerJumpTime, (myLayer == 1 ? 0.5 : 1), spriteScale)
    var _drawX = round((layerJumpX + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5))))
    var _palette = map(_scale, 0.5, 1, 2, 1)
    pal_swap_set(playerPalette, _palette, 0)
    draw_sprite_ext(spriteImage, spriteFrame, _drawX, round(layerJumpY), _scale, _scale, spriteRotation, spriteColor, spriteAlpha)
}
else
{
    if (myLayer == 1)
        pal_swap_set(playerPalette, 1, 0)
    else
        pal_swap_set(playerPalette, 2, 0)
    if (myLayer == 1)
        _drawX = x
    else if (myLayer == 2)
        _drawX = xPosition
    var _squash = (b_squashed && currentState != playerstates.crouch && currentState != playerstates.slide)
    draw_sprite_ext(spriteImage, spriteFrame, round(_drawX), round(y), ((spriteScale * spriteFacing) * (_squash ? 1.5 : 1)), (spriteScale * (_squash ? 0.5 : 1)), spriteRotation, spriteColor, spriteAlpha)
}
pal_swap_reset()
