resizeWindow = function()
{
    window_set_size((viewWidth * settings().windowScale), (viewHeight * settings().windowScale))
    surface_resize(application_surface, viewWidth, viewHeight)
    function_execute(window_center, undefined, 1)
}

viewWidth = 384
viewHeight = 216
display_reset(0, settings().vsync)
self.resizeWindow()
if settings().fullscreen
    function_execute(window_set_fullscreen, 1, 10)
pal_swap_init_system(shd_pal_html_sprite, shd_pal_swapper, shd_pal_html_surface)
global.roomPalette = 1

global.restartRoom = -4
global.checkpointRoom = -4
global.checkpointX = 0
global.checkpointY = 0

alarm[1] = 30
audio_master_gain(settings().masterVolume)
audio_group_load(ag_sounds)
audio_group_load(ag_music)
