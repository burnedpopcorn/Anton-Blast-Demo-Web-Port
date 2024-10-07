warpExecute = function()
{
    collidingPlayer.x = targetX
    collidingPlayer.y = targetY
    collidingPlayer.myLayer = targetLayer
    collidingPlayer.layerDepth = (targetLayer == 1 ? 1 : 0.5)
    if (targetRoom != room)
        room_goto(targetRoom)
}

currentX = x
xPosition = x
myLayer = 1
collidingPlayer = noone
