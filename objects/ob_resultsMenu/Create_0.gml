event_inherited()
beginTransition = function(argument0)
{
    transitioning = 1
    targetRoom = argument0
    with (instance_create_depth(x, y, (depth - 300), ob_transitionPinhole))
        onMidTransition = other.transitionExecute
}

transitionExecute = function()
{
    if (!is_undefined(targetRoom))
        game_reset(targetRoom)
    else
        game_end()
}

alignment.set(1, 1)
x = 64
y = 182
mainPage = self.pageCreate(new menuButton("Replay Level", beginTransition, global.restartRoom), new menuButton("Main Menu", beginTransition, rm_mainMenu), new menuButton("Quit Game", beginTransition))
wellDoneScale = 0
wellDoneRotation = 0
spiritTargetPos = new vector2(((157 + sprite_get_xoffset(sp_spirit)) + camera_get_view_x(view_camera[0])), ((169 + sprite_get_yoffset(sp_spirit)) + camera_get_view_y(view_camera[0])))
spiritPos = new vector2()
healthPos = new vector2(37, 108)
if instance_exists(ob_spirit)
    spiritPos.set(ob_spirit.x, ob_spirit.y)
statsOffset = 120
vinylOffset = statsOffset
totalScoreDisplayed = 0
totalScore = 0
sequenceTime = 0
menuOpen = 0
transitioning = 0
targetRoom = undefined
chipScale = 1
spiritYPosition = (169 + statsOffset)
surf = -1
