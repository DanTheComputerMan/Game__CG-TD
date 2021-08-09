// Draw sprite.
draw_self();
draw_set_color(c_black);
// draw_text(x-15,y-35,string(cost)); // places price above tower
draw_set_font(fntArial10pt);
draw_set_halign(fa_right);
// Show cost of tower to player.
//draw_text(x+14,y+2,"$"+string(cost)); // places price in bottom right of tower
draw_text(x+14,y+8,"$"+string(cost)); // places price in bottom right of tower
draw_set_font(-1); // reset font & font size.
draw_set_halign(-1); // reset font horizontal alignment.
draw_set_color(c_white);

if (rotate_self) image_angle = rotate_angle;