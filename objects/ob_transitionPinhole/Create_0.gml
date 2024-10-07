setTransitionTime = function(argument0)
{
    transitionTime = argument0
    scaleSpeed = (12 / transitionTime)
    alarm[0] = transitionTime
}

onMidTransition = function()
{
}

surf = -1
currentState = 0
transitionTime = 10
alarm[0] = transitionTime
pinholeScale = 12
scaleSpeed = (pinholeScale / transitionTime)
depth = -10000
