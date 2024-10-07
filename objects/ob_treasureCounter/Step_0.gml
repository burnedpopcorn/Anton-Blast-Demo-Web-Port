if ob_runbackManager.b_runbackEnded
    return;

if (leverFrameSpeed > 0)
    leverFrame += leverFrameSpeed
else if (leverFrameSpeed < 0)
    leverFrame -= leverFrameSpeed
	
if (leverFrame == (sprite_get_number(sp_pointCounterLever) - 1))
{
	leverFrame = 0
	leverFrameSpeed = 0
}

if (displayScore < actualScore)
{
    audio_sound_pitch(sn_treasureTick, 1)
    audio_stop_sound(sn_treasureTick)
    audio_play_sound(sn_treasureTick, 1, false)
    spriteAlphaTimer = 240
    displayScore = max((displayScore + 1), round(lerp(displayScore, actualScore, countUpSpeed)))
}
if (displayScore > actualScore)
    displayScore = actualScore
displayString = string(displayScore)
while (string_length(displayString) < 6)
    displayString = ("0" + displayString)

var collectedTreasure = instance_place((x - 66), (y - 3), ob_treasure_par)
if instance_exists(ob_player)
{
    if ob_player.optionKey
    {
        spriteAlphaTimer = 240
        image_speed = 1
    }
}
if collectedTreasure
{
    if collectedTreasure.b_collected
    {
        image_speed = 3
        switch collectedTreasure.sprite_index
        {
            case sp_casinoChipHUD:
                sprite_index = sp_casinoChipHUD
                break
            case sp_casinoChip_BG:
                sprite_index = sp_casinoChipHUD
                break
            case sp_casinoChipRed:
                sprite_index = sp_casinoChipRed
                break
            case sp_bigChip:
                sprite_index = sp_bigChipHUD
                break
            case sp_bigChipVB:
                sprite_index = sp_bigChipHUD
                break
        }

        actualScore += collectedTreasure.treasureValue
        image_index = 0
        spriteScale += 1
        audio_stop_sound(sn_treasureCounter1)
        audio_stop_sound(sn_treasureCounter2)
        audio_stop_sound(sn_treasureCounter3)
        audio_play_sound(choose(sn_treasureCounter1, sn_treasureCounter2, sn_treasureCounter3), 1, false)
        instance_destroy(collectedTreasure)
    }
}
