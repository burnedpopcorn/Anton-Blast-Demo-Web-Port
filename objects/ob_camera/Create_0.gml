snapToPlayer = function()
{
    if instance_exists(ob_player)
    {
        var _x = clamp((ob_player.x - (ob_init.viewWidth / 2)), 0, (room_width - ob_init.viewWidth))
        var _y = clamp((ob_player.y - (ob_init.viewHeight / 2)), 0, (room_height - ob_init.viewHeight))
        camera_set_view_pos(view_camera[0], _x, _y)
    }
}

view_enabled = true
view_visible[0] = true
currentX = x
currentY = y
offset = 0
cloudParallax = 0
screenshakeX = 0
screenshakeY = 0
screenshakeDuration = 0
screenshakeForce = 0
screenshakeBounds = new rect(0, 0, 0, 0)
cloudValue = 0
audio_listener_position((room_width / 2), (room_height / 2), 0)
audio_listener_orientation(0, 0, 1000, 0, -1, 0)
audio_falloff_set_model(1)
self.snapToPlayer()
