camera_set_view_size(view_camera[0], ob_init.viewWidth, ob_init.viewHeight)
if settings().screenshakeEnabled
{
    screenshakeBounds.x = (-screenshakeForce)
    screenshakeBounds.y = (-screenshakeForce)
    //screenshakeBounds.resize((room_width + (screenshakeForce * 2)), (room_height + (screenshakeForce * 2)))
}
if instance_exists(ob_player)
{
    var _cameraHorizontalSpeed = 0.25
    var _cameraVerticalSpeed = 0.25
    var _x = clamp((ob_player.xPosition - (ob_init.viewWidth / 2)), 0, (room_width - ob_init.viewWidth))
    var _y = clamp((ob_player.y - (ob_init.viewHeight / 2)), 0, (room_height - ob_init.viewHeight))
    currentX = camera_get_view_x(view_camera[0])
    currentY = camera_get_view_y(view_camera[0])
    if screenshakeX
    {
        screenshakeDuration -= 1
        if settings().screenshakeEnabled
            _x += choose((-screenshakeForce), screenshakeForce)
        if (screenshakeDuration <= 0)
        {
            screenshakeX = 0
            screenshakeDuration = 5
        }
    }
    if screenshakeY
    {
        screenshakeDuration -= 1
        if settings().screenshakeEnabled
            _y += choose((-screenshakeForce), screenshakeForce)
        if (screenshakeDuration <= 0)
        {
            screenshakeY = 0
            screenshakeDuration = 5
        }
    }
    if ((screenshakeX || screenshakeY) && screenshakeForce >= 10)
    {
        var _vibration = map(screenshakeForce, 0, 40, 0.5, 1)
        gamepad_set_vibration(ob_globalMenuInput.lastDevice, _vibration, _vibration)
    }
    else
        gamepad_set_vibration(ob_globalMenuInput.lastDevice, 0, 0)
    camera_set_view_pos(view_camera[0], lerp(currentX, _x, _cameraHorizontalSpeed), lerp(currentY, _y, _cameraVerticalSpeed))
}
else
{
    _cameraHorizontalSpeed = 0.25
    _cameraVerticalSpeed = 0.25
    _x = (x - (ob_init.viewWidth / 2))
    _y = (y - (ob_init.viewHeight / 2))
    if ((!instance_exists(ob_runbackManager)) || (instance_exists(ob_runbackManager) && (!ob_runbackManager.b_runbackEnded)))
    {
        _x = clamp(_x, 0, (room_width - ob_init.viewWidth))
        _y = clamp(_y, 0, (room_height - ob_init.viewHeight))
    }
    currentX = camera_get_view_x(view_camera[0])
    currentY = camera_get_view_y(view_camera[0])
    if settings().screenshakeEnabled
    {
        if screenshakeX
        {
            screenshakeDuration -= 1
            _x += choose((-screenshakeForce), screenshakeForce)
            if (screenshakeDuration <= 0)
            {
                screenshakeX = 0
                screenshakeDuration = 5
            }
        }
        if screenshakeY
        {
            screenshakeDuration -= 1
            _y += choose((-screenshakeForce), screenshakeForce)
            if (screenshakeDuration <= 0)
            {
                screenshakeY = 0
                screenshakeDuration = 5
            }
        }
    }
    camera_set_view_pos(view_camera[0], lerp(currentX, _x, _cameraHorizontalSpeed), lerp(currentY, _y, _cameraVerticalSpeed))
}
if layer_exists("InstancesBG")
{
    var _BGelements = layer_get_all_elements("InstancesBG")
    for (var i = 0; i < array_length(_BGelements); i++)
    {
        var inst = layer_instance_get_instance(_BGelements[i])
        if (inst != -1 && instance_exists(inst))
            inst.xPosition = (inst.currentX + (camera_get_view_x(view_camera[0]) * 0.5))
    }
}
layer_x("BGTiles", (camera_get_view_x(view_camera[0]) * 0.5))
layer_x("BGTilesFront", (camera_get_view_x(view_camera[0]) * 0.5))
layer_x("BGTilesBack", (camera_get_view_x(view_camera[0]) * 0.5))
layer_x("BGTilesDecoration", (camera_get_view_x(view_camera[0]) * 0.5))
layer_x("BGTilesDecorationFront", (camera_get_view_x(view_camera[0]) * 0.5))
layer_x("Background", (camera_get_view_x(view_camera[0]) * 0.85))
layer_x("Background_1", (camera_get_view_x(view_camera[0]) * 0.9))
if layer_exists("Background_Clouds")
{
    cloudValue += 0.1
    layer_x("Background_Clouds", ((camera_get_view_x(view_camera[0]) * 0.95) + cloudValue))
}
audio_listener_position((camera_get_view_x(view_camera[0]) + (ob_init.viewWidth / 2)), (camera_get_view_y(view_camera[0]) + (ob_init.viewHeight / 2)), 0)
