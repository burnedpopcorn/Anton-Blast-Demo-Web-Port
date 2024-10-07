if (DEBUG)
{
	if (!active)
		exit
	draw_set_font(fn_test)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_alpha(0.5)
	draw_rectangle_color(0, 0, 384, 86, 0, 0, 0, 0, false)
	var search_y = 82
	if (input_text != "" && !ds_list_empty(search_commands))
	{
		var search_h = 86 + (ds_list_size(search_commands) * 8) + 8
		draw_rectangle_color(0, search_y + 5, search_w + 8, search_h, 0, 0, 0, 0, false)
	}
	draw_set_alpha(1)
	var ys = 68 - (8 * ds_list_size(text_list))
	for (var i = 0; i < ds_list_size(text_list); i++)
	{
		var t = array_get(ds_list_find_value(text_list, i), 0)
		var txt = array_get(ds_list_find_value(text_list, i), 1)
		var str = txt
		var c = c_white
		switch (t)
		{
			case debug_text_type.error:
				str = string_concat("[ERROR] ", txt)
				c = c_red
				break
			case debug_text_type.traced:
				str = string_concat("[DEBUG] ", txt)
				c = c_gray
				break
			case debug_text_type.command:
				str = string_concat("[COMMAND] ", txt)
				c = c_green
				break
		}
		draw_text_color(4, ys + (8 * i), str, c, c, c, c, 1)
	}
	draw_text(4, 72, string_concat("> ", input_text))
	if (input_text != "")
	{
		search_y += 4
		for (var w = 0; w < ds_list_size(search_commands); w++)
		{
			var b = ds_list_find_value(search_commands, w)
			if (b != undefined)
				draw_text_color(4, search_y + (8 * w), b, c_white, c_white, c_white, c_white, 1)
		}
	}
}