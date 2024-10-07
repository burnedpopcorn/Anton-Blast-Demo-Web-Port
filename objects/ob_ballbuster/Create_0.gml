event_inherited()
spriteImage = sp_ballbuster_walk
spriteFrameSpeed = 0.2
currentPalette = 0
paletteDirection = -1
b_spawnedParticle = 0
b_bounced = 0
windupTimer = 0
windupTimerMax = 60
myHitbox = instance_create_depth(x, y, depth, ob_ballbuster_hurtbox)
myHitbox.myEnemy = id
myHitbox.myLayer = myLayer
ballbusterStun = function()
{
    y -= 1
    verticalSpeed = -3
    audio_sound_pitch(sn_bounce, random_range(0.8, 1.2))
    audio_play_sound_on(enemySoundEmit, sn_bounce, false, 100)
    spriteFrame = 0
    spriteImage = sp_ballbuster_stunStart
    stunHitTimer = stunHitTimerMax
    getUpTimer = getUpTimerMax
    b_canBounce = 0
    currentState = enemystates.stunned
}

key = treasure_get_key()
treasure_status()
