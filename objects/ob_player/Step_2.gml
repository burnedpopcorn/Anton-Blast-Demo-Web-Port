var _temp_local_var_4;
animation_frame_reset()
animation_control_Anton()
horizontalSpeed /= speedMultiplier
var _meetingConstruction = ds_list_create()
instance_place_list(x, (y - 1), ob_construction_par, _meetingConstruction, false)
b_squashed = 0
for (var i = 0; i < ds_list_size(_meetingConstruction); i++)
{
    var _inst = ds_list_find_value(_meetingConstruction, i)
    if (_inst.kinematic && (!((_inst.destructible && _inst.strength < 2))) && _inst.myLayer == myLayer && (!(((mask_index == sp_playerMaskFG || mask_index == sp_playerMaskBG) && (!(place_meeting(x, y, _inst)))))))
    {
        if (!b_onGround)
        {
            repeat (ob_kinematicsManager.gravitySpeed)
            {
                y += 1
                if check_below()
                    break
            }
        }
        else
            b_squashed = 1
    }
}
ds_list_destroy(_meetingConstruction)
