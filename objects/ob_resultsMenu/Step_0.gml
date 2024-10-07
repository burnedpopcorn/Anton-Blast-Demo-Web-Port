if (transitioning || menuOpen)
{
}
else if (sequenceTime > 480 && ob_globalMenuInput.checkAny())
{
    menuOpen = 1
    disabledInputTimer.time = 3
}
else
{
    global.__betweenVal = sequenceTime
    if in_ranges(global.__betweenVal, 0, 30)
    {
        wellDoneScale = map(sequenceTime, 0, 30, 0, 1)
        wellDoneRotation = map(sequenceTime, 0, 30, 359, 0)
    }
    if in_ranges(global.__betweenVal, 30)
    {
        wellDoneScale = 1
        wellDoneRotation = 0
        screenshake(1, 1, 60, 30)
        audio_play_sound(sn_smack, 1, false)
    }
    if in_ranges(global.__betweenVal, 90, 120)
        statsOffset = lerp(statsOffset, 0, 0.165)
    if in_ranges(global.__betweenVal, 120)
    {
        statsOffset = 0
        with (ob_spirit)
        {
            other.spiritPos.x = x
            other.spiritPos.y = y
            spriteFacing = 1
        }
    }
    if in_ranges(global.__betweenVal, 120, 150)
    {
        spiritPos.lerpTowards(spiritTargetPos, 0.165)
        with (ob_spirit)
        {
            x = other.spiritPos.x
            y = other.spiritPos.y
        }
    }
    if in_ranges(global.__betweenVal, 150)
    {
        spiritPos.set(spiritTargetPos.x, spiritTargetPos.y)
        with (ob_spirit)
        {
            x = other.spiritPos.x
            y = other.spiritPos.y
            spriteFrameSpeed = 0
            spriteFrame = 3
        }
        with (ob_treasureManager)
        {
            if b_spiritCollected
                audio_play_sound(sn_collectVinyl, 1, false)
        }
    }
    if in_ranges(global.__betweenVal, 150, 210)
        vinylOffset = lerp(vinylOffset, 0, 0.165)
    if in_ranges(global.__betweenVal, 210)
    {
        vinylOffset = 0
        with (ob_treasureManager)
        {
            if b_vinylCollected
            {
                audio_play_sound(sn_collectVinyl, 1, false)
                if b_spiritCollected
                    audio_play_sound(sn_antonVoice_happyLaugh, 1, false)
            }
        }
    }
    if in_ranges(global.__betweenVal, [270], [303], [236], [369])
    {
        if (ob_treasureManager.finalHP > 0)
        {
            ob_treasureManager.finalHP -= 1
            ob_treasureCounter.actualScore += 500
            var _particleX = (healthPos.x + (ob_treasureManager.finalHP * 17))
            instance_create_depth(_particleX, healthPos.y, (depth - 100), ob_beetParticle)
            instance_create_depth((_particleX + camera_get_view_x(view_camera[0])), (healthPos.y + camera_get_view_y(view_camera[0])), (depth - 200), ob_500particle)
            audio_play_sound(sn_collectBeet, 1, false)
        }
    }
    if in_ranges(global.__betweenVal, 420)
        totalScore = ob_treasureCounter.actualScore
    if in_ranges(global.__betweenVal, 420, 480)
    {
        chipScale = 2
        var _scoreSpeed = (totalScore / 120)
        ob_treasureCounter.actualScore = approach(ob_treasureCounter.actualScore, 0, _scoreSpeed)
        totalScoreDisplayed = approach(totalScoreDisplayed, totalScore, _scoreSpeed)
        audio_stop_sound(sn_treasureCounter1)
        audio_stop_sound(sn_treasureCounter2)
        audio_stop_sound(sn_treasureCounter3)
        audio_play_sound(choose(sn_treasureCounter1, sn_treasureCounter2, sn_treasureCounter3), 1, false)
    }
    if in_ranges(global.__betweenVal, 480)
    {
        ob_treasureCounter.actualScore = 0
        totalScoreDisplayed = totalScore
    }
    sequenceTime += 1
}
