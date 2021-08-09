// Nothing or something else is currently selected AND mouse is over tower and user clicked on tower,
//if (global.selectedTower == self) {
//	global.selectedTower = noone;
	
//	for (var i = 0; i < array_length(btns); i++) {
//		instance_destroy(btns[i]);
//	}
//	btns = [];


for (var i = 0; i < array_length(btns); i++) {
	instance_destroy(btns[i]);
}
btns = [];

with(oTowerParent) {
	for (var i = 0; i < array_length(btns); i++) {
		instance_destroy(btns[i]);
	}
	btns = [];
}

//if (global.selectedTower == self) { global.selectedTower = noone; exit; } 

//global.selectedTower = noone;
//} else if (global.selectedTower != self and mouseOver(x,y,sprite_width,sprite_height)) {
if (global.selectedTower != self and mouseOver(x,y,sprite_width,sprite_height)) {
	global.selectedTower = self;
	
	// lT = left targeting arrow. rT = right targeting arrow.
	var lT = instance_create_depth(552, 130, -2, oButton);
	var rT = instance_create_depth(630, 130, -2, oButton);
	
	var up1 = instance_create_depth(592, 175, -2, oButton);
	var up2 = instance_create_depth(592, 240, -2, oButton);
	var up3 = instance_create_depth(592, 305, -2, oButton);
	var up4 = instance_create_depth(592, 370, -2, oButton);
	var sell = instance_create_depth(592, 430, -2, oButton);
	lT._width = 10; lT._height = 10; lT.text = "<"; lT.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	lT.func = function() { targetingChoice = targetingChoicesLeft[$ targetingChoice]; };
	rT._width = 10; rT._height = 10; rT.text = ">"; rT.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	rT.func = function() { targetingChoice = targetingChoicesRight[$ targetingChoice]; };
	up1._width = 84; up1._height = 50; up1.text = ""; up1.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	up2._width = 84; up2._height = 50; up2.text = ""; up2.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	up3._width = 84; up3._height = 50; up3.text = ""; up3.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	up4._width = 84; up4._height = 50; up4.text = ""; up4.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	sell._width = 89; sell._height = 20; sell.text = "Sell"; sell.colors = {main: c_black, outline:c_white, hover:c_aqua, bgcolor:c_white, text:c_white};
	sell.func = function() { instance_destroy(); };
	
	btns = [up1, up2, up3, up4, sell, lT, rT];
	
	updateUpgrades();
} else {
	global.selectedTower = noone;
}