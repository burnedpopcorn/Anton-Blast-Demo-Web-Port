if keyboard_check_pressed(vk_numpad0)
    active = (!active)
if (!active)
    return;
if (!instance_exists(myInstance))
{
    myInstance = instance_find(myObject, 0)
    if (myInstance == -4)
        return;
}
varVal = variable_instance_get(myInstance, myVariable)
if (mouse_check_button_pressed(mb_any) && position.contains(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)))
{
    varVal += (((((-increment) * mouse_check_button_pressed(mb_left)) + (increment * mouse_check_button_pressed(mb_right))) * (keyboard_check(vk_shift) ? 10 : 1)) * (keyboard_check(vk_control) ? 0.1 : 1))
    variable_instance_set(myInstance, myVariable, varVal)
}
