var hovered = point_in_rectangle(mouse_x, mouse_y, x - (_width / 2), y - (_height / 2), x + (_width / 2), y + (_height / 2));

//show_debug_message("mouse_x: " + string(device_mouse_x_to_gui(0)) +  "\tmouse_y: " + string(device_mouse_y_to_gui(0)) + "\tx: " + string(x) + "\ty: " + string(y) + "\t_width: " + string(_width) + "\t_height: " + string(_height));


// Calls function since mouse clicked button.
if (hovered && mouse_check_button_pressed(mb_left)) {
	func();
	//if (variable_instance_exists(self, "cost")) global.coins -= cost;
}