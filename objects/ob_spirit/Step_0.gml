animation_frame_counter()
spriteImage = sp_spirit
audio_emitter_position(spiritSoundEmit, xPosition, y, 0)
if (global.roomPalette == 1)
    palette = sp_anton_palette
else if (global.roomPalette == 2)
    palette = sp_anton_palette_sewer
if ob_treasureManager.b_spiritCollected
    b_collected = 1
var collidingPlayer = instance_place(x, y, ob_player)
currentX = x
currentY = y
xPosition = (currentX + (camera_get_view_x(view_camera[0]) * map(layerDepth, 0.5, 1, 0.5, 0)))
oscillateTimer++
if b_collected
{
    if instance_exists(ob_player)
    {
        depth = ob_player.depth
        myLayer = ob_player.myLayer
        spriteFrameSpeed = 0.4
        if (ob_player.spriteFacing == 1)
        {
            targetX = (ob_player.xPosition - 16)
            spriteFacing = 1
        }
        else if (ob_player.spriteFacing == -1)
        {
            targetX = (ob_player.xPosition + 16)
            spriteFacing = -1
        }
        oscillateFrequency = 0.1
        oscillateAmplitude = 15
        anchorY = (targetY + (sin((oscillateTimer * oscillateFrequency)) * oscillateAmplitude))
        if (ob_player.currentState == playerstates.layerjump)
        {
            targetY = round(ob_player.layerJumpY)
            spriteScale = map(ob_player.layerJumpTimer, 0, ob_player.layerJumpTime, (ob_player.myLayer == 1 ? 0.5 : 1), ob_player.spriteScale)
        }
        else
        {
            targetY = (ob_player.y - 16)
            spriteScale = ob_player.spriteScale
        }
        x = lerp(x, targetX, 0.1)
        y = lerp(y, anchorY, 0.1)
    }
}
else
{
    if (!audio_is_playing(sn_spiritPulsate))
        audio_play_sound_on(spiritSoundEmit, sn_spiritPulsate, true, 100)
    if (!instance_exists(ob_shine))
        instance_create_depth(x, (y - 13), (depth + 10), ob_shine)
    if (myLayer == 1)
        spriteScale = 1
    else if (myLayer == 2)
        spriteScale = 0.5
    if collidingPlayer
    {
        if (collidingPlayer.myLayer == myLayer && collidingPlayer.currentState != playerstates.dummy)
        {
            audio_play_sound(sn_collectVinyl, 1, false)
            audio_play_sound(choose(sn_antonVoice_happyLaugh, sn_antonVoice_happyLaugh2), 1, false)
            ob_treasureManager.b_spiritCollected = 1
            audio_stop_sound(sn_spiritPulsate)
            audio_play_sound(sn_spiritCollect, 1, false)
            instance_destroy(ob_shine)
            b_collected = 1
        }
    }
    oscillateFrequency = 0.05
    oscillateAmplitude = 3
    y = (yPosition + (sin((oscillateTimer * oscillateFrequency)) * oscillateAmplitude))
}
x = round(x)
y = round(y)
