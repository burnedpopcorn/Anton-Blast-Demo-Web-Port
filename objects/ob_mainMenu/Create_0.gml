event_inherited()
var _childMethod = function(argument0, argument1)
{
    if (argument0 == mainPage)
        y = 153
    else
        y = 108
    method_inherited(changePage)
}

var _inheritanceData = method_get_self(changePage)
if (_inheritanceData == id)
{
    _inheritanceData = new method_inheritance_data(changePage, _childMethod)
    changePage = _inheritanceData.childWrapper
}
else
    array_push(_inheritanceData.methods, _childMethod)
var _childMethod = function()
{
    save_settings()
    method_inherited(menuCancel)
}

var _inheritanceData = method_get_self(menuCancel)
if (_inheritanceData == id)
{
    _inheritanceData = new method_inheritance_data(menuCancel, _childMethod)
    menuCancel = _inheritanceData.childWrapper
}
else
    array_push(_inheritanceData.methods, _childMethod)

gameStart = function(startArray)
{
    ob_timeAttackManager.enabled = argument[1]
	global.restartRoom = argument[0]
    room_goto(argument[0])
}

remapMenu = function()
{
	if (!instance_exists(ob_remapMenu))
	{
		audio_play_sound(sn_menuAccept, 1, false)
		instance_create_depth(192, 104, 0, ob_remapMenu)
	}
}

alignment.set(1, 1)
textAlignment = 1
creditsPage = self.pageCreate(new menuItem("DIRECTOR - Tony Grayson", fn_credits), new menuItem("PRODUCER - JB Long", fn_credits), new menuItem("GAME & LEVEL DESIGN - Tony Grayson, JB Long", fn_credits), new menuItem("LEAD PROGRAMMER - Massimo Gauthier", fn_credits), new menuItem("ADDITIONAL PROGRAMMING - Tony Grayson, JB Long", fn_credits), new menuItem("ADDITIONAL SHADER PROGRAMMING - sp202", fn_credits), new menuItem("GAMEPLAY ART - Fallatious, Juniper/PinPan, ToadDan", fn_credits), new menuItem("ADDITIONAL GAMEPLAY ART - smalls ", fn_credits), new menuItem("BACKGROUND & ENVIRONMENT ART - Ozone, Juniper/PinPan", fn_credits), new menuItem("ART CLEANUP - ToadDan, Tony Grayson", fn_credits), new menuItem("ILLUSTRATION - Kyoobot, Ozone", fn_credits), new menuItem("MUSIC & SOUND - Tony Grayson", fn_credits), new menuItem("VOICE ACTING - Tony Grayson as Anton", fn_credits), new menuItem("QUALITY ASSURANCE - [c], BlueAura, Jhonnykiller45", fn_credits), new menuItem("", fn_credits), new menuItem("All Rights, including the copyrights of Game,", fn_credits), new menuItem("Scenario, Music, and Program, reserved by SUMMITSPHERE.", fn_credits), new menuItem("", fn_credits), new menuItem("This decompilation is not associated with SUMMITSPHERE in any way.", fn_credits), new menuItem("", fn_credits), new menuItem("", fn_credits), new menuButton("Back", menuCancel))
/*var _windowScaleSelector = new menuOptionSelector("WINDOWED SCALE", [1, 2, 3, 4], undefined, settings(), "windowScale")
with (_windowScaleSelector)
{
    update = function()
    {
        settings().windowScale = value
        ob_init.resizeWindow()
    }
}
*/
var _vsyncToggle = new menuToggle("VSYNC ENABLED", settings().vsync)
with (_vsyncToggle)
{
    update = function()
    {
        settings().vsync = value
        display_reset(0, value)
    }
}

var _masterVolumeSlider = new menuSlider("MASTER VOLUME", 0, 100, 5, (settings().masterVolume * 100))
with (_masterVolumeSlider)
{
    update = function()
    {
        var _newVolume = (value / 100)
        settings().masterVolume = _newVolume
        audio_set_master_gain(0, _newVolume)
    }
}

var _sfxVolumeSlider = new menuSlider("SFX VOLUME", 0, 100, 5, (settings().sfxVolume * 100))
with (_sfxVolumeSlider)
{
    update = function()
    {
        var _newVolume = (value / 100)
        settings().sfxVolume = _newVolume
        audio_group_set_gain(ag_sounds, _newVolume, 0)
        audio_stop_sound(sn_antonVoice_happyLaugh)
        audio_play_sound(sn_antonVoice_happyLaugh, 0, false)
    }
}

var _musicVolumeSlider = new menuSlider("MUSIC VOLUME", 0, 100, 5, (settings().musicVolume * 100))
with (_musicVolumeSlider)
{
    update = function()
    {
        var _newVolume = (value / 100)
        settings().musicVolume = _newVolume
        audio_sound_gain(mu_titlescreen, _newVolume, 0)
    }
}

settingsPage = self.pageCreate(new menuButton("REMAP INPUTS", remapMenu), new menuButton("TOGGLE FULLSCREEN", function()
{
    var _fullscreen = (!window_get_fullscreen())
    window_set_fullscreen(_fullscreen)
    if (!_fullscreen)
        function_execute(window_center, undefined, 15)
    settings().fullscreen = _fullscreen
}
), /*_windowScaleSelector,*/ _vsyncToggle, _masterVolumeSlider, _sfxVolumeSlider, _musicVolumeSlider, new menuToggle("SCREENSHAKE ENABLED", undefined, settings(), "screenshakeEnabled"), new menuToggle("SCREEN DISTORTION VFX ENABLED", undefined, settings(), "wavyEnabled"), new menuButton("BACK", menuCancel))

levelSelectPage = self.pageCreate(new menuItem("CHOOSE."), new menuItem(""), new menuButton("BOILER CITY", gameStart, [rm_BoilerIntroA, false]), new menuButton("BOILER CITY - TIME ATTACK", gameStart, [rm_BoilerIntroA, true]), new menuButton("TEST ROOM", gameStart, [rm_testStage5, false]), new menuButton("BACK", menuCancel))

mainPage = self.pageCreate(new menuButton("PLAY DEMO!", changePage, levelSelectPage), new menuButton("OPTIONS", changePage, settingsPage), new menuButton("CREDITS", changePage, creditsPage), new menuButton("VISIT THE STEAM PAGE!", url_open, "http://antonblast.com"), new menuButton("VISIT WEB PORT GITHUB", url_open, "https://github.com/burnedpopcorn/Anton-Blast-Demo-Web-Port"))//new menuButton("QUIT", game_end))

if (!audio_is_playing(mu_titlescreen))
{
	audio_play_sound(mu_titlescreen, 100, true)
	audio_sound_gain(mu_titlescreen, settings().musicVolume, 0)
}
