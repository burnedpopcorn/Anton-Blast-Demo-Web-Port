if (!transitioning)
{
    var _anyPressed = keyboard_check_pressed(vk_anykey)
    for (var i = 0; i < gamepad_get_device_count(); i++)
    {
        if gamepad_check_any(i, 0)
            _anyPressed = 1
    }
    if _anyPressed
        self.beginTransition()
}
