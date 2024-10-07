function draw_input_prompts(argument0, argument1, argument2)
{
    draw_set_alignment(0, 1)
    for (var i = 0; i < array_length(argument2); i++)
    {
        var _prompt = argument2[i]
        draw_sprite(_prompt[0], 0, argument0, argument1)
        argument0 += sprite_get_width(_prompt[0])
        if (array_length(_prompt) > 1)
        {
            var _string = ((": " + _prompt[1]) + " ")
            draw_text(argument0, (argument1 + (sprite_get_height(_prompt[0]) / 2)), _string)
            argument0 += string_width(_string)
        }
    }
}

