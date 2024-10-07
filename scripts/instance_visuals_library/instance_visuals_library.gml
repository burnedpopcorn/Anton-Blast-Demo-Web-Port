function instance_animate(argument0, argument1, argument2)
{
    if is_undefined(argument1)
        argument1 = floor((sprite_get_duration(argument0) * room_speed))
    argument2 = (is_undefined(argument2) ? id : argument2)
    var _delay = function_execute(instance_sprite_change, [argument2, argument2.sprite_index], argument1)
    _delay.instanceAnimateFlag = 1
    argument2.image_index = 0
    argument2.sprite_index = argument0
}

function instance_animate_stop()
{
    with (ob_delay)
    {
        if variable_instance_exists(id, "instanceAnimateFlag")
            self.execute()
    }
}

function instance_sprite_change(argument0, argument1)
{
    if instance_exists(argument0)
        argument0.sprite_index = argument1
}

