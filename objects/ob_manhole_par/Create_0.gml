event_inherited()
warpStart = function()
{
    with (ob_player)
    {
        currentState = playerstates.dummy
        visible = false
    }
    audio_play_sound(sn_enterManhole, 1, false)
    audio_play_sound(sn_manhole, 1, false)
    audio_play_sound(sn_manholeBury, 1, false)
    sprite_index = enterSprite
    image_index = 0
    image_speed = 1
    screenshake(1, 1, 60, 10)
}

manholewarpEnd = function(targetwarp)
{
	if (manholeID == targetwarp)
	{
		with (ob_player)
		{
			x = other.exitX
			y = other.exitY
		}
		sprite_index = exitSprite
		image_index = 0
		image_speed = 1
		alarm[0] = 50
	}
}

warpEnd = function()
{
    with (ob_player)
    {
        currentState = playerstates.normal
        visible = true
    }
    audio_play_sound(sn_exitManhole, 1, false)
    audio_play_sound(sn_manhole, 1, false)
    screenshake(1, 1, 30, 5)
}

myLayer = 1
enterSprite = sp_manhole
exitSprite = sp_manhole
exitX = x
exitY = y
exitTime = 1
image_speed = 0
depth = (layer_get_depth("InstancesFG") - 200)
