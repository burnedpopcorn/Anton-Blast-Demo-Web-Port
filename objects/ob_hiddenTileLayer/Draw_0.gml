shader_set(sh_hiddenTileLayer)
tileAlpha = shader_get_uniform(sh_hiddenTileLayer, "tileAlpha")
shader_set_uniform_f(tileAlpha, tileAlpha2)
shader_reset()
