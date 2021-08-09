/// @description Destroy all buttons (upgrade and tower).
for (var i = 0; i < array_length(btns); i++) {
	instance_destroy(btns[i]); // Destroy all buttons (upgrade and sell).
}
btns = [];

// Refund part of the tower's cost.
global.coins += (properties.cost * 0.8);
	
global.selectedTower = noone;