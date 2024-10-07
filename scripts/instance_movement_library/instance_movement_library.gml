function instance_move(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = self
    argument1.x += argument0.x
    argument1.y += argument0.y
}

function instance_move_to_point(argument0, argument1, argument2)
{
    if (!is_array(argument0))
        argument0 = [argument0]
    if (argument2 == undefined)
        argument2 = id
    with (ob_instanceMover)
    {
        if (myInstance == argument2)
            instance_destroy()
    }
    var _mover = instance_create(ob_instanceMover)
    with (_mover)
    {
        myInstance = argument2
        positions = argument0
        moveSpeed = argument1
        currentPosition.set(argument2.x, argument2.y)
    }
    if (argument1 > 0)
    {
        var _tripDistance = 0
        var _lastPos = new vector2(argument2.x, argument2.y)
        for (var i = 0; i < array_length(argument0); i++)
        {
            _tripDistance += vector2_distance(_lastPos, argument0[i])
            _lastPos = argument0[i]
        }
        return (_tripDistance / argument1);
    }
    return 0;
}

