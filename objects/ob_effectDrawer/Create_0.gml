stop = function()
{
    if destroy
        instance_destroy()
    else
    {
        image_speed = 0
        image_index -= 1
    }
}

draw = function()
{
    gpu_set_blendmode(blendmode)
    draw_self()
    gpu_set_blendmode(bm_normal)
}

blendmode = 0
destroy = 1
drawEvent = 8
