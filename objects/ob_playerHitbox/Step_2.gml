if (!instance_exists(myPlayer))
{
    instance_destroy()
    return;
}
x = myPlayer.x
y = myPlayer.y
image_xscale = (myPlayer.spriteFacing * myPlayer.spriteScale)
image_yscale = (myPlayer.spriteScale * (myPlayer.b_squashed ? 0.5 : 1))
var _collisionInstances = ds_list_create()
instance_place_list(x, y, ob_construction_par, _collisionInstances, false)
instance_place_list(x, y, ob_enemy_par, _collisionInstances, false)
for (var i = 0; i < ds_list_size(_collisionInstances); i++)
{
    with (ds_list_find_value(_collisionInstances, i))
    {
        if (myLayer == other.myPlayer.myLayer)
            self.onHitboxCollision(other.id)
    }
}
ds_list_destroy(_collisionInstances)
