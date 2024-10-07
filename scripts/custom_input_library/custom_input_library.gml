function player_input(argument0)
{
    if (!gamepad_is_connected(argument0))
    {
        leftKey = (keyboard_check(input().keys.left) && (!keyboard_check(input().keys.right)))
        leftKeyPressed = keyboard_check_pressed(input().keys.left)
        rightKey = (keyboard_check(input().keys.right) && (!keyboard_check(input().keys.left)))
        rightKeyPressed = keyboard_check_pressed(input().keys.right)
        upKey = keyboard_check(input().keys.up)
        upKeyPressed = keyboard_check_pressed(input().keys.up)
        downKey = keyboard_check(input().keys.down)
        downKeyPressed = keyboard_check_pressed(input().keys.down)
        attackKey = keyboard_check_pressed(input().keys.attack)
        attackKeyHeld = keyboard_check(input().keys.attack)
        jumpKey = keyboard_check_pressed(input().keys.jump)
        jumpKeyHeld = keyboard_check(input().keys.jump)
        optionKey = keyboard_check(input().keys.option)
        chipKey = keyboard_check_pressed(input().keys.chip)
        slideKey = keyboard_check_pressed(input().keys.slide)
    }
    else
    {
        var _directionalInput = instance_find(ob_globalMenuInput, 0)
        leftKey = (_directionalInput.leftHeld || gamepad_button_check(argument0, gp_padl))
        leftKeyPressed = (_directionalInput.left || gamepad_button_check_pressed(argument0, gp_padl))
        rightKey = (_directionalInput.rightHeld || gamepad_button_check(argument0, gp_padr))
        rightKeyPressed = (_directionalInput.right || gamepad_button_check_pressed(argument0, gp_padr))
        upKey = (_directionalInput.upHeld || gamepad_button_check(argument0, gp_padu))
        upKeyPressed = (_directionalInput.up || gamepad_button_check_pressed(argument0, gp_padu))
        downKey = (_directionalInput.downHeld || gamepad_button_check(argument0, gp_padd))
        downKeyPressed = (_directionalInput.down || gamepad_button_check_pressed(argument0, gp_padd))
        jumpKey = gamepad_button_check_pressed(argument0, input().buttons.jump)
        jumpKeyHeld = gamepad_button_check(argument0, input().buttons.jump)
        attackKey = gamepad_button_check_pressed(argument0, input().buttons.attack)
        attackKeyHeld = gamepad_button_check(argument0, input().buttons.attack)
        optionKey = gamepad_button_check(argument0, input().buttons.option)
        chipKey = gamepad_button_check_pressed(argument0, input().buttons.chip)
        slideKey = gamepad_button_check_pressed(argument0, input().buttons.slide)
        if downKey
        {
            var _horizontalAmount = _directionalInput.gamepadAxesLastFrame[argument0].left.x
            if (_horizontalAmount < -0.5)
                leftKey = 1
            else if (_horizontalAmount > 0.5)
                rightKey = 1
        }
    }
}

function input()
{
    static _out = load_custom_inputs()
    return _out;
}

function save_custom_inputs()
{
    file_text_save_string("antonblast_custom_input.txt", json_stringify(input()))
}

function load_custom_inputs()
{
    if file_exists("antonblast_custom_input.txt")
        return json_parse(file_text_load_string("antonblast_custom_input.txt"));
    return 
    {
        keys: 
        {
            left: vk_left,
            right: vk_right,
            up: vk_up,
            down: vk_down,
            attack: ord("X"),
            jump: ord("Z"),
            option: ord("C"),
            chip: ord("A"),
            slide: vk_shift
        },
        buttons: 
        {
            attack: gp_face3,
            jump: gp_face1,
            option: gp_face4,
            chip: gp_shoulderlb,
			slide: gp_shoulderrb
        }
    };
}

