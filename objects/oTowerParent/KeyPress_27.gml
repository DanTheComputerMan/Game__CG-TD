/// @description Escape Key (Esc)

global.selectedTower = noone;
	
for (var i = 0; i < array_length(btns); i++) {
	instance_destroy(btns[i]); // Destroy all buttons (upgrade and sell).
}
btns = [];