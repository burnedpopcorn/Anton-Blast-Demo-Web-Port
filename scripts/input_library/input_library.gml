function input_constant_to_string(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = 1
    if argument1
    {
        switch argument0
        {
            case 49:
                return "1";
            case 50:
                return "2";
            case 51:
                return "3";
            case 52:
                return "4";
            case 53:
                return "5";
            case 54:
                return "6";
            case 55:
                return "7";
            case 56:
                return "8";
            case 57:
                return "9";
            case 81:
                return "Q";
            case 87:
                return "W";
            case 69:
                return "E";
            case 82:
                return "R";
            case 84:
                return "T";
            case 89:
                return "Y";
            case 85:
                return "U";
            case 73:
                return "I";
            case 79:
                return "O";
            case 80:
                return "P";
            case 65:
                return "A";
            case 83:
                return "S";
            case 68:
                return "D";
            case 70:
                return "F";
            case 71:
                return "G";
            case 72:
                return "H";
            case 74:
                return "J";
            case 75:
                return "K";
            case 76:
                return "L";
            case 90:
                return "Z";
            case 88:
                return "X";
            case 67:
                return "C";
            case 86:
                return "V";
            case 66:
                return "B";
            case 78:
                return "N";
            case 77:
                return "M";
            case 18:
                return "Alt";
            case 17:
                return "Ctrl";
            case 13:
                return "Enter";
            case 9:
                return "Tab";
            case 16:
                return "Shift";
            case 32:
                return "Space";
            case 8:
                return "BckSpc";
            case 38:
                return "Up";
            case 37:
                return "Left";
            case 40:
                return "Down";
            case 39:
                return "Right";
            case 27:
                return "Esc";
        }

    }
    else
    {
        switch argument0
        {
            case 32769:
                return "A";
            case 32770:
                return "B";
            case 32771:
                return "X";
            case 32772:
                return "Y";
            case 32773:
                return "LB";
            case 32774:
                return "RB";
            case 32775:
                return "LT";
            case 32776:
                return "RT";
            case 32778:
                return "Start";
            case 32777:
                return "Select";
            case 32781:
                return "D-pad";
            case 32783:
                return "D-pad";
            case 32782:
                return "D-pad";
            case 32784:
                return "D-pad";
        }

    }
    return undefined;
}

function gamepad_check_any(argument0, argument1, argument2)
{
    if (argument1 == undefined)
        argument1 = 1
    if (argument2 == undefined)
        argument2 = 0.5
    for (var i = gp_face1; i <= gp_padr; i++)
    {
        if gamepad_button_check(argument0, i)
            return 1;
    }
    if (!argument1)
        return 0;
    for (i = gp_axislh; i < 32788; i++)
    {
        if (abs(gamepad_axis_value(argument0, i)) > argument2)
            return 1;
    }
    return 0;
}

function menu_input_detect(argument0, argument1)
{
    if (argument1 == undefined)
        argument1 = 0
    if argument1
        menu_input_reset()
    if (argument0 == -1)
    {
        up = (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || up)
        left = (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || left)
        down = (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || down)
        right = (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || right)
        leftHeld = (keyboard_check(vk_left) || leftHeld)
        rightHeld = (keyboard_check(vk_right) || rightHeld)
        confirm = (keyboard_check_pressed(ord("K")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || confirm)
        cancel = (keyboard_check_pressed(ord("J")) || keyboard_check_pressed(vk_shift) || keyboard_check_pressed(ord("X")) || cancel)
        cancelHeld = (keyboard_check(ord("J")) || cancelHeld)
        option = (keyboard_check_pressed(vk_shift) || option)
        extra = (keyboard_check_pressed(vk_control) || extra)
        start = (keyboard_check_pressed(vk_escape) || start)
        select = (keyboard_check_pressed(vk_alt) || select)
        lb = (keyboard_check_pressed(ord("Q")) || lb)
        rb = (keyboard_check_pressed(ord("E")) || rb)
        lt = (keyboard_check_pressed(ord("A")) || lt)
        rt = (keyboard_check_pressed(ord("D")) || rt)
        altUp = (keyboard_check_pressed(ord("W")) || altUp)
        altLeft = (keyboard_check_pressed(ord("A")) || altLeft)
        altDown = (keyboard_check_pressed(ord("S")) || altDown)
        altRight = (keyboard_check_pressed(ord("D")) || altRight)
    }
    else if gamepad_is_connected(argument0)
    {
        var _axes = gamepadAxesLastFrame[argument0]
        var _leftStickHorizontalMovementLastFrame = abs(_axes.left.x) > abs(_axes.left.y)
        var _leftStickCenteredLastFrameHorizontal = (abs(_axes.left.x) <= gamepadDeadzone || (!_leftStickHorizontalMovementLastFrame))
        var _leftStickCenteredLastFrameVertical = (abs(_axes.left.y) <= gamepadDeadzone || _leftStickHorizontalMovementLastFrame)
        with (_axes)
        {
            left.set(gamepad_axis_value(argument0, gp_axislh), gamepad_axis_value(argument0, gp_axislv))
            right.set(gamepad_axis_value(argument0, gp_axisrh), gamepad_axis_value(argument0, gp_axisrv))
        }
        var _leftStickOutsideDeadzoneHorizontal = abs(_axes.left.x) > gamepadDeadzone
        var _leftStickOutsideDeadzoneVertical = abs(_axes.left.y) > gamepadDeadzone
        var _leftStickCrossedCenterHorizontal = (_leftStickCenteredLastFrameHorizontal && _leftStickOutsideDeadzoneHorizontal)
        var _leftStickCrossedCenterVertical = (_leftStickCenteredLastFrameVertical && _leftStickOutsideDeadzoneVertical)
        var _leftStickHorizontalMovement = abs(_axes.left.x) > abs(_axes.left.y)
        up = ((_leftStickCrossedCenterVertical && (!_leftStickHorizontalMovement) && _axes.left.y < 0) || gamepad_button_check_pressed(argument0, gp_padu) || up)
        left = ((_leftStickCrossedCenterHorizontal && _leftStickHorizontalMovement && _axes.left.x < 0) || gamepad_button_check_pressed(argument0, gp_padl) || left)
        down = ((_leftStickCrossedCenterVertical && (!_leftStickHorizontalMovement) && _axes.left.y > 0) || gamepad_button_check_pressed(argument0, gp_padd) || down)
        right = ((_leftStickCrossedCenterHorizontal && _leftStickHorizontalMovement && _axes.left.x > 0) || gamepad_button_check_pressed(argument0, gp_padr) || right)
        upHeld = ((_leftStickOutsideDeadzoneVertical && (!_leftStickHorizontalMovement) && _axes.left.y < 0) || upHeld)
        leftHeld = ((_leftStickOutsideDeadzoneHorizontal && _leftStickHorizontalMovement && _axes.left.x < 0) || leftHeld)
        downHeld = ((_leftStickOutsideDeadzoneVertical && (!_leftStickHorizontalMovement) && _axes.left.y > 0) || downHeld)
        rightHeld = ((_leftStickOutsideDeadzoneHorizontal && _leftStickHorizontalMovement && _axes.left.x > 0) || rightHeld)
        confirm = (gamepad_button_check_pressed(argument0, gp_face1) || confirm)
        cancel = (gamepad_button_check_pressed(argument0, gp_face2) || cancel)
        cancelHeld = (gamepad_button_check(argument0, gp_face2) || cancelHeld)
        option = (gamepad_button_check_pressed(argument0, gp_face3) || option)
        extra = (gamepad_button_check_pressed(argument0, gp_face4) || extra)
        start = (gamepad_button_check_pressed(argument0, gp_start) || start)
        select = (gamepad_button_check_pressed(argument0, gp_select) || select)
        lb = (gamepad_button_check_pressed(argument0, gp_shoulderl) || lb)
        rb = (gamepad_button_check_pressed(argument0, gp_shoulderr) || rb)
        lt = (gamepad_button_check_pressed(argument0, gp_shoulderlb) || lt)
        rt = (gamepad_button_check_pressed(argument0, gp_shoulderrb) || rt)
        altUp = (gamepad_button_check_pressed(argument0, gp_padu) || altUp)
        altLeft = (gamepad_button_check_pressed(argument0, gp_padl) || altLeft)
        altDown = (gamepad_button_check_pressed(argument0, gp_padd) || altDown)
        altRight = (gamepad_button_check_pressed(argument0, gp_padr) || altRight)
    }
}

function menu_input_reset()
{
    up = 0
    left = 0
    down = 0
    right = 0
    upHeld = 0
    leftHeld = 0
    downHeld = 0
    rightHeld = 0
    confirm = 0
    cancel = 0
    cancelHeld = 0
    option = 0
    extra = 0
    start = 0
    select = 0
    lb = 0
    rb = 0
    lt = 0
    rt = 0
    altUp = 0
    altLeft = 0
    altDown = 0
    altRight = 0
    if (!(variable_instance_exists(id, "gamepadAxesLastFrame")))
    {
        gamepadDeadzone = 0.5
        gamepadAxesLastFrame = array_create(gamepad_get_device_count())
        for (var i = 0; i < array_length(gamepadAxesLastFrame); i++)
        {
            gamepadAxesLastFrame[i] = 
            {
                left: new vector2(),
                right: new vector2()
            }

        }
    }
}

