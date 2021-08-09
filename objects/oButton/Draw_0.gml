var orig_color = draw_get_color();
var orig_alpha = draw_get_alpha();

var border_left = x - (_width / 2);
var border_right = x + (_width / 2);
var border_top = y - (_height / 2);
var border_bottom = y + (_height / 2);

var hovered = point_in_rectangle(mouse_x, mouse_y, border_left, border_top, border_right, border_bottom);

//window_set_cursor(cr_none);
//cursor_sprite = sBomb;

imageExists = variable_instance_exists(self, "image");
costExists = variable_instance_exists(self, "cost");
descriptionExists = variable_instance_exists(self, "description");

if (imageExists) {
	draw_sprite_stretched(image, 0, border_left, border_top, _width, _height);
}
if (costExists) {
	draw_set_halign(fa_center);
	draw_text(x, border_bottom-18, "$"+string(cost));
	draw_set_halign(fa_left);
}

draw_set_color(colors.main);
draw_set_alpha(0.9);
draw_rectangle(border_left, border_top, border_right, border_bottom, imageExists);

if (hovered) { // If user is hovering over button.
	if (!imageExists) {
		draw_set_color(colors.bgcolor);
		draw_set_alpha(0.2);
	}
	draw_rectangle(border_left, border_top, border_right, border_bottom, imageExists);
	draw_set_color(colors.hover);
	draw_set_alpha(1);
} else {
	draw_set_color(colors.outline);
	draw_set_alpha(0.3);
}

draw_rectangle(border_left, border_top, border_right, border_bottom, imageExists);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(colors.text);
draw_set_alpha(1);
draw_text(x, y, text);


if (descriptionExists && hovered) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	var p = 5; // padding
	var strWidth = string_width(description);
	draw_set_color(merge_color(c_white, c_gray, 0.1));
	draw_rectangle(mouse_x - p - strWidth, mouse_y - p, mouse_x + p, mouse_y + string_height(description) + p, false);
	draw_set_color(c_black);
	draw_text(mouse_x - strWidth, mouse_y, description);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
}
// Reset and return.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(orig_color);
draw_set_alpha(orig_alpha);

// Buggy as it only registers the first button created as being hovered on.
//cursor_sprite = (hovered == 1) ? sCursor : sBomb;