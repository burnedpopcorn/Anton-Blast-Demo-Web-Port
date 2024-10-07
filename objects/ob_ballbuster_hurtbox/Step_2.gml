if (!instance_exists(myEnemy))
{
    instance_destroy()
    return;
}
x = myEnemy.x
y = myEnemy.y
image_xscale = (myEnemy.spriteFacing * myEnemy.spriteScale)
image_yscale = myEnemy.spriteScale
myLayer = myEnemy.myLayer
xPosition = (x + (myLayer == 1 ? 0 : (camera_get_view_x(view_camera[0]) * 0.5)))