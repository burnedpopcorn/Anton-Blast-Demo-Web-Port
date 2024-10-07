function print()
{
    var _out = ""
    for (var i = 0; i < argument_count; i++)
    {
        _out += string(argument[i])
        if (i < (argument_count - 1))
            _out += ", "
    }
    show_debug_message(_out)
}

function print_array(argument0)
{
    for (var i = 0; i < array_length(argument0); i++)
        print(argument0[i])
}

function debug_draw()
{
    draw_set_font(fn_test)
    draw_set_color(c_fuchsia)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    var _offset = (string_height("M") * 1.5)
    for (var i = 0; i < argument_count; i++)
    {
        var _data = argument[i]
        draw_text(_offset, (_offset * (i + 1)), ((string(_data[0]) + ": ") + string(_data[1])))
    }
}

function debugconsole_string_split(argument0, argument1)
{
	argument0 += " "
	var _current_str = ""
	var _list = [0]
	for (var i = 1; i < string_length(argument0) + 1; i++)
	{
		var _char = string_char_at(argument0, i)
		if _char != argument1
			_current_str += _char
		else
		{
			array_push(_list, _current_str)
			_current_str = ""
		}
	}
	return _list;
}

function debugconsole_function(args_array, func)
{
	var _size = array_length(args_array)
	switch _size - 1
	{
		case -1:
			func()
			break
		case 0:
			func(args_array[0])
			break
		case 1:
			func(args_array[0], args_array[1])
			break
		case 2:
			func(args_array[0], args_array[1], args_array[2])
			break
		case 3:
			func(args_array[0], args_array[1], args_array[2], args_array[3])
			break
		case 4:
			func(args_array[0], args_array[1], args_array[2], args_array[3], args_array[4])
			break
		case 5:
			func(args_array[0], args_array[1], args_array[2], args_array[3], args_array[4], args_array[5])
			break
		case 6:
			func(args_array[0], args_array[1], args_array[2], args_array[3], args_array[4], args_array[5], args_array[6])
			break
	}
}

function DebugCommand(command_ident, command_description, command_format, command_func) constructor
{
	command_id = command_ident
	description = command_description
	format = command_format
	func = command_func
	
	Invoke = function(args)
	{
		if args != undefined
			debugconsole_function(args, func)
		else
			func()
	}
}

function debugconsole_textlist_add(argument0, argument1)
{
	with (ob_debugconsole)
	{
		if (DEBUG)
			ds_list_add(text_list, [argument0, argument1])
	}
}
