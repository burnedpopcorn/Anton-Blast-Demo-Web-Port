currentState++
switch currentState
{
    case 1:
        pinholeScale = 0
        break
    case 2:
        var _midTransitionSelf = method_get_self(onMidTransition)
        if (is_struct(_midTransitionSelf) || instance_exists(_midTransitionSelf))
            self.onMidTransition()
        else
        {
            instance_destroy()
            return;
        }
        break
    case 3:
        instance_destroy()
        break
}

alarm[0] = transitionTime
