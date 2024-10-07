var _temp_local_var_3, _temp_local_var_4;
function menuItem(argument0, argument1) constructor
{
    displayText = argument0
    value = undefined
    myMenu = other.id
    myFont = (nc_set(argument1) ? global.nc_val : other.defaultFont)
    draw_set_font(myFont)
    size = new vector2(string_width(displayText), string_height("M"))
    interactable = 0
    draw = function(argument0)
    {
        draw_set_font(myFont)
        draw_text(self.getDrawX(argument0), argument0.y, displayText)
    }

    getDrawX = function(argument0)
    {
        switch myMenu.textAlignment
        {
            case 0:
                return argument0.x;
            case 1:
                argument0.x = (argument0.x + (argument0.width / 2))
                return argument0.x;
            case 2:
                argument0.x = argument0.getRight()
                return argument0.x;
        }

    }

    interact = function()
    {
    }

}

function boundMenuItem(argument0, argument1, argument2, argument3) constructor
{
    var _temp_local_var_4 = menuItem(argument0, argument3)
    update = function()
    {
    }

    myObject = argument1
    objectVarName = argument2
    if ((!is_undefined(myObject)) && (!is_undefined(objectVarName)))
    {
        value = (is_struct(myObject) ? variable_struct_get(myObject, objectVarName) : variable_instance_get(myObject, objectVarName))
        update = function()
        {
            if is_struct(myObject)
                variable_struct_set(myObject, objectVarName, value)
            else
                variable_instance_set(myObject, objectVarName, value)
        }

    }
}

