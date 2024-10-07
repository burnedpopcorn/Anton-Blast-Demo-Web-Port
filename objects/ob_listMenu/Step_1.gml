if is_undefined(inputDevice)
    inputObject = instance_find(ob_globalMenuInput, 0)
else
{
    inputObject = id
    menu_input_detect(inputDevice, 1)
}
