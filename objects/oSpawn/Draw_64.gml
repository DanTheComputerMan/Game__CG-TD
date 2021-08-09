/// @description Insert description here
// You can write your code in this editor

if (global.sandbox) exit;

draw_set_color(c_black);
if (global.selectedTower) { // Glitch that I still need to work out where selecting a tower causes this to move.
	draw_text(68,30,"Coins: $" + string(global.coins)); // +10 y
	draw_text(46,45,"Level: " + string(global.level));
	draw_set_color(c_red);
	draw_text(50,65,"Lives: " + string(global.lives_left));
} else {
	draw_text(10,25,"Coins: $" + string(global.coins));
	draw_text(10,45,"Level: " + string(global.level));
	draw_set_color(c_red);
	draw_text(10,65,"Lives: " + string(global.lives_left));
}
draw_set_color(c_white);