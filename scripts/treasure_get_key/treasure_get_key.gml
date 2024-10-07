function treasure_get_key()
{
    return (((room_get_name(room) + object_get_name(object_index)) + string(x)) + string(y));
}

