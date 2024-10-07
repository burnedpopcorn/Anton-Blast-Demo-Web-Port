function check_below_passthrough(argument0)
{
    if (argument0 == undefined)
        argument0 = y
    return (currentState != playerstates.ladderclimb && position_meeting(x, argument0, myPassthrough) && (!(position_meeting(x, (argument0 - 1), myPassthrough))) && verticalSpeed > -0.001);
}

