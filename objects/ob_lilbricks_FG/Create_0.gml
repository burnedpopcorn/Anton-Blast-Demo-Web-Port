event_inherited()
animation_init()
spriteImage = sprite_index
spriteFrame = irandom_range(0, 0)
spriteFrameSpeed = 0
destructibleDestroySound = choose(sn_brickBreak, sn_brickBreak2, sn_brickBreak3)
destructibleTreasure = ob_chip
destructibleTreasureAmount = irandom_range(3, 8)
destructibleParticleAmount = 45
destructibleParticleType = global.particleBrick
destructibleParticleSprite = sp_brick_particle
