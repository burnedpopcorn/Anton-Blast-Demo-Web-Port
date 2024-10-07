event_inherited()
animation_init()
spriteImage = sprite_index
spriteFrame = irandom_range(0, 3)
spriteFrameSpeed = 0
currentX = x
destructibleDestroySound = sn_crateBreak
destructibleTreasure = ob_chip_bg
destructibleTreasureAmount = irandom_range(1, 5)
destructibleParticleType = global.particleCrateBG
destructibleParticleSprite = sp_crate_particleBG
destructibleParticleAmount = irandom_range(15, 25)
destructibleParticleLayer = global.p_systemBG
myLayer = 2
