/// @description Insert description here
// You can write your code in this editor

global.selectedTower = noone; // to avoid bug related to tower being selected that moves text to the left and off screen.

draw_set_color(c_red);
draw_text(room_width / 2.5, room_height / 10,"Game Over.");
draw_set_color(c_green);
draw_text(room_width / 3, room_height / 5,"Money: $" + string(global.coins));
draw_set_color(c_blue);
draw_text(room_width / 3, room_height / 4,"Round: " + string(global.level));
draw_set_color(c_orange);
draw_text(room_width / 3, room_height / 3.3,"Difficulty: " + string(global.difficulty));
draw_set_color(c_black);
draw_text(room_width / 4, room_height / 2,"Click anywhere to go the main menu.");
draw_set_color(c_white);