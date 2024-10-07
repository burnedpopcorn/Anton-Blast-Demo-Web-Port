function goto_room(argument0)
{
    room_goto(argument0)
}

function quit_game()
{
    game_end()
}

function equals()
{
    var _compareVal = argument[0]
    for (var i = 1; i < argument_count; i++)
    {
        if (_compareVal == argument[i])
            return 1;
    }
    return 0;
}

