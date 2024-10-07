/// @params method
/// @params time
function create_timer(argument0, argument1)
{
    var _timer = instance_create(ob_timer)
    _timer.time = argument1
    _timer.myMethod = argument0
    _timer.myInstance = id
    _timer.persistent = persistent
    return _timer;
}

