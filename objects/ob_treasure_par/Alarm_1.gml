mask_index = sprite_index
audio_stop_sound(treasureCollectSound)
audio_sound_pitch(treasureCollectSound, random_range(0.95, 1.05))
audio_play_sound(treasureCollectSound, 1, false)
instance_create_depth(xPosition, (y - 4), -1000, treasureParticle)
x = xPosition
myLayer = 1
b_collected = 1
