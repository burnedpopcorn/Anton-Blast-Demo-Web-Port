function settings()
{
    static _out = load_settings()
    return _out;
}

function save_settings()
{
    file_text_save_string("antonblast_settings.txt", json_stringify(settings()))
}

function load_settings()
{
	var settingsfile;
    if file_exists("antonblast_settings.txt")
        settingsfile = json_parse(file_text_load_string("antonblast_settings.txt"))
    else
        settingsfile = {}
    return struct_load(settingsfile, 
    {
        windowScale: 2,
        fullscreen: 0,
        vsync: 0,
        masterVolume: 0.7,
        sfxVolume: 1,
        musicVolume: 1,
        screenshakeEnabled: 1,
        wavyEnabled: 1
    }
	);
}

