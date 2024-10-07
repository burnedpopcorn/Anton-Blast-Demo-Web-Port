function file_find_all_folders(argument0)
{
    var _folders = [argument0]
    for (var i = 0; i < array_length(_folders); i++)
    {
        argument0 = _folders[i]
        for (var _currentFile = file_find_first((argument0 + "\\*"), 16); _currentFile != ""; _currentFile = file_find_next())
        {
            if directory_exists((argument0 + _currentFile))
                array_append(_folders, ((argument0 + _currentFile) + "\\"))
        }
    }
    file_find_close()
    return _folders;
}

function environment_get_username()
{
    return environment_get_variable("USERNAME");
}

function file_text_save_string(argument0, argument1)
{
    var _file = file_text_open_write(argument0)
    file_text_write_string(_file, argument1)
    file_text_close(_file)
}

function file_text_load_string(argument0)
{
    if (!file_exists(argument0))
        return undefined;
    var _file = file_text_open_read(argument0)
    var _out = file_text_read_string(_file)
    file_text_close(_file)
    return _out;
}

