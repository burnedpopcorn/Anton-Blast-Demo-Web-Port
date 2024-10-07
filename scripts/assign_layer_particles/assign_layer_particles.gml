function assign_layer_particles()
{
    if (myLayer == 1)
    {
        if (room == rm_VBJam)
        {
            myLandingDustParticle = global.particleLandingDustVB
            myFootDustParticle = global.particleFootDustVB
            myAssBlastParticle = global.particleAssBlastVB
            myAssBlast2Particle = global.particleAssBlast2VB
			myClutchDustParticle = global.particleClutchDustVB
        }
        else
        {
            myLandingDustParticle = global.particleLandingDust
            myFootDustParticle = global.particleFootDust
            myAssBlastParticle = global.particleAssBlast
            myAssBlast2Particle = global.particleAssBlast2
            myClutchDustParticle = global.particleClutchDust
        }
    }
    else
    {
        myLandingDustParticle = global.particleLandingDustBG
        myFootDustParticle = global.particleFootDustBG
        myAssBlastParticle = global.particleAssBlastBG
        myAssBlast2Particle = global.particleAssBlast2BG
		myClutchDustParticle = global.particleClutchDustBG
    }
}

