var _temp_local_var_2;
event_inherited()
remapButton = function(argument0, argument1, argument2, argument3) constructor
{
    remapKey = argument1
    inputStruct = argument2
    menuItem(argument0, argument3)
	interactable = true
    interact = function()
    {
        if myMenu.inputObject.confirm
        {
            myMenu.currentRemapKey = remapKey
            keyboard_lastkey = -1
        }
    }

    draw = function(argument0)
    {
        draw_set_font(myFont)
        draw_text(argument0.x, argument0.y, ((displayText + ": ") + input_constant_to_string(variable_struct_get(inputStruct, remapKey), inputStruct == input().keys)))
    }

}

alignment.set(1, 1)
textAlignment = 1
currentRemapKey = undefined
keysPage = self.pageCreate(new menuItem("Keyboard Inputs RB)"))
buttonsPage = self.pageCreate(new menuItem("(LB Gamepad Inputs"))
for (var i = 0; i < 2; i++)
{
    if (i == 0)
    {
        var _page = keysPage
        var _inputs = input().keys
    }
    else
    {
        _page = buttonsPage
        _inputs = input().buttons
    }
    var _varNames = variable_struct_get_names(_inputs)
    ds_list_add(_page, "up", "left", "down", "right", "jump", "attack", "option", "chip", "slide")
    for (var j = 0; j < array_length(_varNames); j++)
    {
        var _button = new remapButton(string_clean(_varNames[j]), _varNames[j], _inputs)
        var _replacePos = ds_list_find_index(_page, _varNames[j])
        if (_replacePos == -1)
            ds_list_add(_page, _button)
        else
            ds_list_replace(_page, _replacePos, _button)
    }
    j = 0
    while (j < ds_list_size(_page))
    {
        if is_string(ds_list_find_value(_page, j))
            ds_list_delete(_page, j)
        else
            j++
    }
}
self.changePage(keysPage, false)
bookMode = 1
destructible = 1
instance_deactivate_object(ob_mainMenu)