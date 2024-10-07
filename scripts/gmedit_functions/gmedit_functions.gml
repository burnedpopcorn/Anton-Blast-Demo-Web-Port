function sfmt(argument0)
{
    var w = ds_map_find_value(global.sfmt_map, argument0)
    if (w == undefined)
    {
        w[0] = ""
        ds_map_set(global.sfmt_map, argument0, w)
        var i = string_pos("%", argument0)
        var n = 0
        while i
        {
            w[n++] = string_copy(argument0, 1, (i - 1))
            argument0 = string_delete(argument0, 1, i)
            i = string_pos("%", argument0)
        }
        w[n++] = argument0
    }
    else
        n = array_length(w)
    var b = global.sfmt_buf
    buffer_seek(b, buffer_seek_start, 0)
    buffer_write(b, buffer_text, w[0])
    var m = argument_count
    for (i = 1; i < n; i++)
    {
        if (i < m)
        {
            argument0 = string(argument[i])
            if (argument0 != "")
                buffer_write(b, buffer_text, argument0)
        }
        argument0 = w[i]
        if (argument0 != "")
            buffer_write(b, buffer_text, argument0)
    }
    buffer_write(b, buffer_u8, 0)
    buffer_seek(b, buffer_seek_start, 0)
    return buffer_read(b, buffer_string);
}

global.nc_val = undefined
function nc_set(argument0)
{
    global.nc_val = argument0
    return argument0 != undefined;
}

