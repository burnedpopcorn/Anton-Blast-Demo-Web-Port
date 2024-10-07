animation_frame_counter()
spriteImage = sp_vinyl
var collidingPlayer = instance_place(x, y, ob_player)
currentX = x
currentY = y
xPosition = (currentX + (camera_get_view_x(view_camera[0]) * map(layerDepth, 0.5, 1, 0.5, 0)))
oscillateTimer++
if (myLayer == 1)
    spriteScale = 1
else if (myLayer == 2)
    spriteScale = 0.5
if ((!instance_exists(ob_shine)) && (!b_collected))
    instance_create_depth((x + 12), (y + 12), (depth + 10), ob_shine)
if (collidingPlayer && (!b_collected))
{
    if (collidingPlayer.myLayer == myLayer)
    {
        for (var i = 0; i < 12; i += 1)
        {
            part_type_sprite(global.particleVinyl, sp_vinylParticle, 0, 0, 1)
            part_type_speed(global.particleVinyl, 0, 0, 0.5, 0)
            part_type_direction(global.particleVinyl, 0, 360, 0, 0)
            part_type_gravity(global.particleVinyl, 0, 0)
            part_particles_create(global.p_system, (x + 12), (y + 12), global.particleVinyl, 1)
        }
        instance_destroy(ob_shine)
        audio_play_sound(sn_collectVinyl, 1, false)
        audio_play_sound(choose(sn_antonVoice_happyLaugh, sn_antonVoice_happyLaugh2), 1, false)
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
        ob_treasureManager.b_vinylCollected = 1
        sprite_index = sp_vinylCollect
        b_collected = 1
    }
}
oscillateFrequency = 0.05
oscillateAmplitude = 3
y = (yPosition + (sin((oscillateTimer * oscillateFrequency)) * oscillateAmplitude))
x = round(x)
y = round(y)
