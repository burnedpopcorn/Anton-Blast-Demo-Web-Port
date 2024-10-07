var _order = 1
if (myOrder == 0)
{
    with (ob_varTweaker)
    {
        if (id != other.id)
        {
            myOrder = _order
            _order++
        }
    }
}
draw_set_font(fn_test)
var _off = string_height("M")
position = new rect(0, (_off * myOrder), string_width(" aVeryLongVariable: 100 "), _off)
