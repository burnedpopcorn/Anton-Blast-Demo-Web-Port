function assign_layer_objects()
{
    if (myLayer == 1)
    {
        myBlock = ob_block_FG
        myPassthrough = ob_passthrough_FG
        mySlope = ob_slope_FG
        myLadder = ob_ladder_FG
        myDoor = ob_door_FG
        myWarp = ob_warp_FG
        mySpring = ob_spring_FG
        mySprout = ob_sprout
        myBeet = ob_beet
        myExplosion = ob_explosion
        myHurtyExplosion = ob_explosivecrate_explosion
        myExplosiveCrate = ob_explosivecrate_FG
        myParticleLayer = global.p_system
    }
    else
    {
        myBlock = ob_block_BG
        myPassthrough = ob_passthrough_BG
        mySlope = ob_slope_BG
        myLadder = ob_ladder_BG
        myDoor = ob_door_BG
        myWarp = ob_warp_BG
        mySpring = ob_spring_BG
        mySprout = -4
        myBeet = -4
        myExplosion = ob_explosion_BG
        myHurtyExplosion = -4
        myExplosiveCrate = -4
        myParticleLayer = global.p_systemBG
    }
}

