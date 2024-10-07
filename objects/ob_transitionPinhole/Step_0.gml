switch currentState
{
    case 0:
        pinholeScale = approach(pinholeScale, 0, scaleSpeed)
        break
    case 2:
        pinholeScale += scaleSpeed
        break
}

