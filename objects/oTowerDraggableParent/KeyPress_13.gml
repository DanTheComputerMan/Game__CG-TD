// When you place down the tower.
if (col == c_white) {
	instance_destroy();
	instance_create_depth(mouse_x,mouse_y,-1,tower);
}