playerCollision = function(argument0, argument1)
{
    if (argument0 == undefined)
        argument0 = x
    if (argument1 == undefined)
        argument1 = (y + 1)
    var _collidingPlayer = instance_place(argument0, argument1, ob_player)
    var _col = (_collidingPlayer != noone && myLayer == _collidingPlayer.myLayer)
    if _col
        self.onPlayerCollision(_collidingPlayer)
    return _col;
}

collisionCheck = function()
{
    instance_deactivate_object(id)
    var _col = (place_meeting(x, (y + 1), (myLayer == 1 ? ob_block_FG : ob_block_BG)) || self.playerCollision())
    instance_activate_object(id)
    return _col;
}

onPlayerCollision = function(argument0)
{
    if (argument0 == undefined)
        argument0 = ob_player
    if (destructible && strength < 2)
        self.destructibleDestroy()
    else
        argument0.b_squashed = 1
}

onHitboxCollision = function(argument0)
{
}

destructibleDestroy = function()
{
    audio_stop_sound(destructibleDestroySound)
    audio_sound_pitch(destructibleDestroySound, random_range(0.95, 1.05))
    audio_play_sound(destructibleDestroySound, 1, false)
    screenshake(1, 1, 5, 5)
    for (var i = 0; i < destructibleTreasureAmount; i += 1)
    {
        with (instance_create_depth((x + random_range(-8, 8)), (y + random_range(-8, 8)), depth, destructibleTreasure))
        {
            mask_index = sp_empty
            alarm[1] = irandom_range(7, 10)
            verticalSpeed = random_range(-2, -4)
            horizontalSpeed = random_range(-4, 4)
        }
    }
    for (i = 0; i < destructibleParticleAmount; i += 1)
    {
        part_type_sprite(destructibleParticleType, destructibleParticleSprite, 0, 0, 1)
        part_type_speed(destructibleParticleType, 2, 4, 0.2, 0)
        part_type_direction(destructibleParticleType, 0, 180, 0, 0)
        part_type_gravity(destructibleParticleType, 0.35, 270)
        part_particles_create(destructibleParticleLayer, (xPosition + irandom_range(0, sprite_get_width(sprite_index))), (y + irandom_range(4, sprite_get_height(sprite_index))), destructibleParticleType, 1)
    }
    b_collected = 1
    if instance_exists(ob_comboCounter)
    {
        ob_comboCounter.spriteAlphaTimer = 240
        ob_comboCounter.comboCounter += 1
        ob_comboCounter.spriteScale += 0.5
        ob_comboCounter.spriteAlpha = 1
    }
    if instance_exists(ob_treasureManager)
        ds_map_replace(ob_treasureManager.treasureStatus, key, 1)
    instance_destroy(self)
}

xPosition = x
currentX = x
myLayer = 0
destructibleDestroySound = -4
destructibleTreasure = noone
destructibleTreasureAmount = 0
destructibleParticleType = global.particleCrate
destructibleParticleSprite = sp_crate_particle
destructibleParticleAmount = 0
destructibleParticleLayer = global.p_system
key = treasure_get_key()
treasure_status()
if kinematic
    conserved = 1
conservedID = undefined
if conserved
    conservedID = ((((object_get_name(object_index) + ",") + string(x)) + ",") + string(y))
