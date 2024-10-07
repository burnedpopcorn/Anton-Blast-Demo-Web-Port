if is_undefined(currentRemapKey)
    event_inherited()
else
{
    var _newInput = undefined
    if (currentPage == buttonsPage)
    {
        var _device = ob_globalMenuInput.lastDevice
        if (!gamepad_is_connected(_device))
            return;
        var i = gp_face1
        while (i < 32781)
        {
            if gamepad_button_check_pressed(_device, i)
            {
                _newInput = i
                break
            }
            else
                i++
        }
    }
    else if (!is_undefined(input_constant_to_string(keyboard_lastkey)))
        _newInput = keyboard_lastkey
    if (!is_undefined(_newInput))
    {
        if (!((_newInput == 32778 || _newInput == 32777 || _newInput == 27)))
        {
            var _inputStruct = (currentPage == keysPage ? input().keys : input().buttons)
            variable_struct_set(_inputStruct, currentRemapKey, _newInput)
        }
        currentRemapKey = undefined
    }
}
