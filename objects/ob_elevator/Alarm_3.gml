if (endingSequence == undefined)
	exit;
if (audio_is_playing(mu_elevator))
	exit;

var explosionAmount = 1

if (explosionSpeed < 20 && explosionSpeed >= 15)
	explosionAmount = 3
else if (explosionSpeed < 15 && explosionSpeed >= 10)
	explosionAmount = 4
else if (explosionSpeed < 10 && explosionSpeed >= 5)
	explosionAmount = 5
else if (explosionSpeed < 5)
	explosionAmount = 6
	
print(explosionAmount, explosionSpeed)

repeat (explosionAmount)
	instance_create_depth(random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + 400), random_range(0, room_height), -500, ob_explosionEffect)

audio_stop_sound(sn_explosiveCrate)
audio_sound_pitch(sn_explosiveCrate, 1)
audio_play_sound(sn_explosiveCrate, 1, false)

explosionSpeed--
if (explosionSpeed < 15)
	explosionSpeed--
if (explosionSpeed > 20 && explosionSpeed < 40)
	explosionSpeed = 20
alarm[3] = explosionSpeed