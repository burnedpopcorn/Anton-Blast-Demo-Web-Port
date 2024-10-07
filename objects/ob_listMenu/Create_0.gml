var _temp_local_var_1, _temp_local_var_2, _temp_local_var_4, _temp_local_var_5, _temp_local_var_8, _temp_local_var_9, _temp_local_var_13, _temp_local_var_14, _temp_local_var_20, _temp_local_var_21;
menuButton = function(argument0, argument1, argument2, argument3) constructor
{
    myMethod = argument1
    params = argument2
    menuItem(argument0, argument3)
	interactable = (!is_undefined(argument1))
    interact = function()
    {
        if myMenu.inputObject.confirm
            function_execute(myMethod, params)
    }

}

menuOptionSelector = function(argument0, argument1, argument2, argument3, argument4, argument5) constructor
{
    options = argument1
    boundMenuItem(argument0, argument3, argument4, argument5)
    if (argument2 == undefined)
        argument2 = 0
    currentOptionIndex = ((!is_undefined(value)) ? (nc_set(array_find(options, value)) ? global.nc_val : argument2) : argument2)
    interactable = 1
    var _longestOptionWidth = 0
    for (var i = 0; i < array_length(argument1); i++)
        _longestOptionWidth = max(_longestOptionWidth, string_width((string(argument1[i]) + ": <>")))
    size.x += _longestOptionWidth
    interact = function()
    {
        var _dir = (myMenu.inputObject.right - myMenu.inputObject.left)
        var _newInd = (currentOptionIndex + _dir)
        if (_dir != 0 && _newInd >= 0 && _newInd < array_length(options))
        {
            currentOptionIndex = _newInd
            value = options[currentOptionIndex]
            self.update()
        }
    }

    draw = function(argument0)
    {
        var _text = string(options[currentOptionIndex])
        if (currentOptionIndex != 0)
            _text = ("<" + _text)
        if (currentOptionIndex != (array_length(options) - 1))
            _text += ">"
        _text = ((displayText + ": ") + _text)
        draw_text(self.getDrawX(argument0), argument0.y, _text)
    }

}

menuToggle = function(argument0, argument1, argument2, argument3, argument4) constructor
{
    boundMenuItem(argument0, argument2, argument3, argument4)
    if (value == undefined)
        value = argument1
    interactable = 1
    interact = function()
    {
        if myMenu.inputObject.confirm
        {
            value = (!value)
            self.update()
        }
    }

    size.x += string_width(": FALSE")
    draw = function(argument0)
    {
        draw_text(self.getDrawX(argument0), argument0.y, ((displayText + ": ") + (value ? "TRUE" : "FALSE")))
    }

}

menuSlider = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) constructor
{
    minVal = argument1
    maxVal = argument2
    boundMenuItem(argument0, argument5, argument6, argument7)
    if (value == undefined)
        value = argument4
    value = clamp(value, argument1, argument2)
    increment = argument3
    interactable = 1
    size.x += string_width((((": " + string(argument2)) + "/") + string(argument2)))
    interact = function()
    {
        var _dir = (myMenu.inputObject.right - myMenu.inputObject.left)
        var _newVal = (value + (_dir * increment))
        if (_dir != 0 && _newVal >= minVal && _newVal <= maxVal)
        {
            value = _newVal
            self.update()
        }
    }

    draw = function(argument0)
    {
        draw_text(self.getDrawX(argument0), argument0.y, ((((displayText + ": ") + string(value)) + "/") + string(maxVal)))
    }

}

changePage = function(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = (!bookMode)
    if argument1
	{
		audio_play_sound(sn_menuAccept, 1, false)
        ds_stack_push(pageHistory, currentPage)
	}
    currentPage = argument0
    selectedItemIndex = -1
    var i = 0
    while (i < ds_list_size(currentPage))
    {
        if ds_list_find_value(currentPage, i).interactable
        {
            selectedItemIndex = i
            break
        }
        else
            i++
    }
    self.resize()
}

resize = function()
{
    ninesliceInfo = sprite_get_nineslice(backSprite)
    backRect.width = 0
    backRect.height = (ninesliceInfo.top + ninesliceInfo.bottom)
    for (var i = 0; i < ds_list_size(currentPage); i++)
    {
        var _stringSize = ds_list_find_value(currentPage, i).size
        backRect.height += _stringSize.y
        if (_stringSize.x > backRect.width)
            backRect.width = _stringSize.x
    }
    backRect.width += ((ninesliceInfo.left + ninesliceInfo.right) + cursorOffset)
    switch alignment.x
    {
        case 0:
            backRect.x = x
            break
        case 1:
            backRect.x = ((x - (backRect.width / 2)) + 0.5)
            break
        case 2:
            backRect.x = ((x - backRect.width) + 1)
    }

    switch alignment.y
    {
        case 0:
            backRect.y = y
            break
        case 1:
            backRect.y = ((y - (backRect.height / 2)) + 0.5)
            break
        case 2:
            backRect.y = ((y - backRect.height) + 1)
    }

}

pageCreate = function()
{
    var _page = ds_list_create()
    for (var i = 0; i < argument_count; i++)
        ds_list_add(_page, argument[i])
    array_push(pages, _page)
    return _page;
}

menuCancel = function()
{
	audio_play_sound(sn_pauseEnd, 1, false)
    if (ds_stack_size(pageHistory) > 0)
        self.changePage(ds_stack_pop(pageHistory), 0)
    else if destructible
        instance_destroy()
}

changeItem = function(argument0)
{
    if (abs(argument0) != 1)
        return;
    var i = (selectedItemIndex + argument0)
    while (i >= 0 && i < ds_list_size(currentPage))
    {
        if ds_list_find_value(currentPage, i).interactable
        {
			audio_play_sound(sn_trafficCone2, 1, false)
            selectedItemIndex = i
            return;
        }
        i += argument0
    }
}

pageHistory = ds_stack_create()
pages = []
currentPage = undefined
selectedItemIndex = 0
destructible = 0
backSprite = sp_blankNineslice3
backRect = new rect(0, 0, 0, 0)
ninesliceInfo = sprite_get_nineslice(backSprite)
alignment = new vector2(0, 0)
disabledInputTimer = create_timer(undefined, 1)
inputDevice = undefined
inputObject = undefined
bookMode = 0
bookPage = 0
defaultFont = global.fontLevelName
textColor = 9474192
selectedTextColor = 1110264
textOutline = 1
outlinePalette = sp_menuOutlinePalette
cursorOffset = (sprite_get_width(sp_menuCursor) + 4)
textAlignment = 0
