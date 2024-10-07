event_inherited()
onHitboxCollision = function(argument0)
{
    with (argument0.myPlayer)
    {
        switch currentState
        {
            case playerstates.assblast:
                self.playerAssBlastLand()
                b_assBlastCollided = 0
                assBlastRecoveryTimer = -1
                other.warpStart()
                break
        }

    }
}

var _childMethod = function()
{
    method_inherited(warpEnd)
    with (ob_player)
        verticalSpeed = jumpPower
}

var _inheritanceData = method_get_self(warpEnd)
if (_inheritanceData == id)
{
    _inheritanceData = new method_inheritance_data(warpEnd, _childMethod)
    warpEnd = _inheritanceData.childWrapper
}
else
    array_push(_inheritanceData.methods, _childMethod)
enterSprite = sp_manholeFloorEnter
exitSprite = sp_manholeFloorExit
exitTime = 45
exitY -= 1
