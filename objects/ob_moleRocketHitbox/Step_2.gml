if (!instance_exists(myRocket))
{
    instance_destroy()
    return;
}
x = (myRocket.x + (10 * myRocket.rocketDirection))
y = myRocket.y
image_angle = myRocket.image_angle
