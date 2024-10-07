event_inherited()
animation_init()
spriteImage = sprite_index
spriteFrame = irandom_range(0, 0)
spriteFrameSpeed = 0
currentX = x
destructibleDestroySound = choose(sn_brickBreak, sn_brickBreak2, sn_brickBreak3)
destructibleTreasure = ob_chip_bg
destructibleTreasureAmount = irandom_range(3, 8)
destructibleParticleAmount = irandom_range(20, 30)
destructibleParticleType = global.particleBrickBG
destructibleParticleSprite = sp_brick_particleBG
destructibleParticleLayer = global.p_systemBG
