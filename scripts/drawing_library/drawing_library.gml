function draw_set_alignment(argument0, argument1)
{
    draw_set_halign(argument0)
    draw_set_valign(argument1)
}

// Don't use this, just don't.
/// @params x
/// @params y
/// @params string
//function draw_text_shaky(textx, texty, textstr)
//{
//	var currentLength = 0
//	for (var i = 1; i <= string_length(textstr); i++)
//	{
//		draw_set_halign(fa_left)
//		var currentChar = string_copy(textstr, i, 1)
//		draw_text(textx + currentLength + random_range(-1, 1), texty + random_range(-1, 1), currentChar)
//		currentLength += string_width(currentChar)
//	}
//}