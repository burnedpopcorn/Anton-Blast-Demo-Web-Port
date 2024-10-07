event_inherited()

reactivateAndReset = function(argument0)
{
    instance_activate_all()
    function_execute(game_reset, argument0, 1)
}

checkpointReset = function()
{
	instance_activate_all()
	function_execute(checkpoint_reset)
}

menuCancel = ob_pause_handler.unpause
destructible = 1
alignment.set(0, 1)
spriteFrame = 0
spriteFrameSpeed = 1
menuBackground = sp_static
x = 8
y = 46
mainPage = self.pageCreate(new menuButton("Resume", menuCancel), new menuButton("Return to Last Checkpoint", checkpointReset), new menuButton("Restart Stage", reactivateAndReset, global.restartRoom), new menuButton("Quit to Main Menu", reactivateAndReset, rm_mainMenu))//, new menuButton("Quit Game", game_end))
