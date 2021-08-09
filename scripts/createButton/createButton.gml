// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createButton(_x, _y, _str, _width, _height, _color, _hover, _bgcolor){
	var xx = _x; var yy = _y;
	var str = _str;
	var w = _width / 2; var h = _height / 2;
	var color0 = _color;
	var color1 = _hover;
	var color2 = _bgcolor;
	
	var orig_color = draw_get_color();
	var orig_alpha = draw_get_alpha();
	
	var border_left = xx - w;
	var border_right = xx + w;
	var border_top = yy - h;
	var border_bottom = yy + h;
	
	var within = (mouse_x > border_left && mouse_x < border_right && mouse_y > border_top && mouse_y < border_bottom);
	
	if (within) {
		draw_set_color(color2);
		draw_set_alpha(0.2);
		draw_rectangle(border_left, border_top, border_right, border_bottom, false);
		draw_set_color(color1);
		draw_set_alpha(1);
	} else {
		draw_set_color(color0);
		draw_set_alpha(0.3);
	}
	
	draw_rectangle(border_left, border_top, border_right, border_bottom, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx, yy, str);
	
	// Reset and return.
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(orig_color);
	draw_set_alpha(orig_alpha);
	
	return (within && mouse_check_button_pressed(mb_left));
}