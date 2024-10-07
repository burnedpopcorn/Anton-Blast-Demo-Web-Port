if (!instance_exists(myInstance))
{
    instance_destroy()
    return;
}
if (moveSpeed < 0)
    currentPosition = positions[currentTargetPositionIndex]
else
    currentPosition.approachVector(positions[currentTargetPositionIndex], moveSpeed)
myInstance.x = currentPosition.x
myInstance.y = currentPosition.y
if currentPosition.equalsVector(positions[currentTargetPositionIndex])
{
    currentTargetPositionIndex++
    if (currentTargetPositionIndex >= array_length(positions))
        instance_destroy()
}
