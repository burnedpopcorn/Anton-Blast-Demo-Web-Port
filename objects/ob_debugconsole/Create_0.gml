enum debug_text_type
{
	normal,
	command,
	traced,
	error
}

depth = -9999
DEBUG = (GM_build_type == "run")
if (parameter_count() > 2)
	DEBUG = true
if (!DEBUG)
{
	var n = parameter_count()
	for (var i = 0; i < n; i++)
	{
		var s = parameter_string(i)
		if (s == "-debug" || s == "debug")
			DEBUG = true
	}
}
if (!DEBUG)
	instance_destroy()
if (DEBUG)
{
	SHOW_COLLISIONS = new DebugCommand("showcollisions", "Show room collisions", "<bool>", function(argument0)
	{
		if (argument0 == undefined)
			exit
		argument0 = get_bool(argument0)
		if (argument0 != undefined)
		{
			showcollisions = argument0
			event_perform(ev_other, ev_room_start)
		}
	});
	RUNBACK = new DebugCommand("runback", "Start runback", "", function()
	{
		ob_runbackManager.runbackStart()
	});
	ROOM_GOTO = new DebugCommand("room_goto", "Go to specified room", "<targetRoom> <targetX> <targetY> <targetLayer>", function(argument0, argument1, argument2, argument3)
	{
		if (argument0 == undefined)
			exit
		argument0 = asset_get_index(argument0)
		if (argument0 == -1)
			exit
		with (ob_player)
		{
			if (argument1 != undefined)
				x = argument1
			if (argument2 != undefined)
				y = argument2
			if (argument3 != undefined)
			{
				myLayer = argument3
				layerDepth = (argument3 == 1 ? 1 : 0.5)
			}
		}
		if (argument0 != room)
			room_goto(argument0)
	});
	active = false
	showcollisions = false
	command_list = ds_list_create()
	ds_list_add(command_list, SHOW_COLLISIONS, RUNBACK, ROOM_GOTO)
	input_text = "";
	text_list = ds_list_create();
	search_commands = ds_list_create();
	ds_list_clear(search_commands);
	search_w = 0;
	keyboard_string = "";
	function FindCommand(_id)
	{
		for (var i = 0; i < ds_list_size(command_list); i++)
		{
			var b = ds_list_find_value(command_list, i);
			if (b.command_id == _id)
				return b;
		}
		return undefined;
	}
	function DoCommand(text)
	{
		var commands = debugconsole_string_split(text, " ");
		if (array_length(commands) > 1)
		{
			var c = FindCommand(commands[1]);
			if (c != undefined)
			{
				debugconsole_textlist_add(1, text);
				array_delete(commands, 0, 2);
				c.Invoke(commands);
				return true;
			}
			else
			{
				debugconsole_textlist_add(0, text);
				debugconsole_textlist_add(3, "Invalid command");
			}
		}
		else
		{
			debugconsole_textlist_add(0, text);
			debugconsole_textlist_add(3, "No text typed");
		}
		return false;
	}
	function GetDouble(str)
	{
		var n = string_digits(str);
		if (n != undefined && n != "")
		{
			n = real(str);
			return n;
		}
		return undefined;
	}
	function get_bool(str)
	{
		if (str == "true")
		{
			str = true;
			return str;
		}
		else if (str == "false")
		{
			str = false;
			return str;
		}
		else if (is_real(real(string_digits(str))))
		{
			str = bool(real(string_digits(str)));
			return str;
		}
		return undefined;
	}
	function get_number_string(str)
	{
		var n = str;
		if (is_string(str))
		{
			n = real(string_digits(str));
			if (string_char_at(str, 1) == "-")
				n = -real(string_digits(str));
		}
		return n;
	}
}