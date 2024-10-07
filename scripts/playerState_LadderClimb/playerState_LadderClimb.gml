function playerState_LadderClimb()
{
    var currentLadder = instance_place(x, y, myLadder)
    if ((upKey && (!(place_meeting(x, y, myLadder)))) || (place_meeting(x, (y + 1), myBlock) && downKey) || (!(place_meeting(x, (y + 2), myLadder))))
    {
        gravitySpeed = 0.225
        self.playerLandTransition()
        currentState = playerstates.normal
    }
    else if currentLadder
    {
        gravitySpeed = 0
        x = (currentLadder.x + (currentLadder.sprite_width / 2))
    }
    if upKey
        verticalSpeed = approach(verticalSpeed, (-climbSpeed), 0.25)
    else if downKey
        verticalSpeed = approach(verticalSpeed, 3, 0.25)
    else
        verticalSpeed = approach(verticalSpeed, 0, 0.25)
}

