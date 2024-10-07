if ((!active) || (!instance_exists(myInstance)))
    return;
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fn_test)
draw_rectangle(position.x, position.y, position.getRight(), position.getBottom(), false)
draw_set_color(c_black)
draw_text(position.x, position.y, ((myVariable + ": ") + string(varVal)))
