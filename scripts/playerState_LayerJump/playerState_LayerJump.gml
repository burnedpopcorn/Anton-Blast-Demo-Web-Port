function playerState_LayerJump()
{
    self.updateHitbox()
    if b_canMoveLayerJump
    {
        var _moveDir = (rightKey - leftKey)
        horizontalSpeed = (layerJumpMaxHorizontalSpeed * _moveDir)
        if (_moveDir != 0)
            spriteFacing = _moveDir
    }
    verticalSpeed = 0
    layerJumpX = approach(layerJumpX, x, 0.4)
    layerJumpX += horizontalSpeed
    layerJumpVerticalSpeed += layerJumpGrav
    if (layerJumpVerticalSpeed < 0)
        layerJumpY += layerJumpVerticalSpeed
    else
    {
        layerJumpY = approach(layerJumpY, y, layerJumpVerticalSpeed)
        if (layerJumpY == y)
        {
            if (!b_onGround)
                verticalSpeed = layerJumpVerticalSpeed
            if b_onGround
            {
                audio_stop_sound(sn_antonLandGround)
                audio_play_sound_on(playerSoundEmit, sn_antonLandGround, false, 1)
                self.playerLandTransition()
            }
            currentState = playerstates.normal
        }
    }
    layerJumpTimer++
}

