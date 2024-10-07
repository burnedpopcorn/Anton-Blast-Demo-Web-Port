var _newLastDevice = undefined
menu_input_detect(-1, 1)
if self.checkAny()
    _newLastDevice = -1
for (var i = 0; i < gamepad_get_device_count(); i++)
{
    menu_input_detect(i)
    if (is_undefined(_newLastDevice) && self.checkAny())
        _newLastDevice = i
}
if (!is_undefined(_newLastDevice))
    lastDevice = _newLastDevice
