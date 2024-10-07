if instance_exists(ob_runbackManager)
{
    if ob_runbackManager.b_runbackStarted
    {
        sprite_index = sp_elevatorOpen
        var _meetingPlayer = instance_position(x, (y - 1), ob_player)
        if (_meetingPlayer != noone && _meetingPlayer.myLayer == 1)
        {
            visible = false
            instance_destroy(ob_pause_handler)
            ob_treasureManager.finalHP = _meetingPlayer.playerHealth
            ob_timeAttackManager.timerActive = 0
            instance_destroy(_meetingPlayer)
            ob_runbackManager.runbackStop()
            audio_stop_all()
            endingSequence = layer_sequence_create("PseudoGUI", x, y, sq_elevatorEnd)
			alarm[3] = explosionSpeed
            with (ob_spirit)
            {
                if b_collected
                    depth = -300
            }
            var _center = instance_get_bbox_center(id)
            with (ob_camera)
            {
                x = _center.x
                y = (_center.y - 23)
            }
        }
    }
}
if (endingSequence != undefined)
{
    if (endingSequence == -1)
    {
        bgRotation += bgRotationSpeed
        bgPaletteTime += 0.5
    }
    else if layer_sequence_is_finished(endingSequence)
    {
        layer_sequence_destroy(endingSequence)
        endingSequence = -1
        depth = -200
        visible = true
        sprite_index = sp_elevatorResults
        instance_create_depth(x, y, (depth - 100), ob_resultsMenu)
    }
}
