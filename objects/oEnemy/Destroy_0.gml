/// @description Insert description here
// You can write your code in this editor

if (escaped) {
	// global.lives_left -= 1;
	if (global.lives_left <= 0) {
		room_goto(RoomGameOver);
	}
} else {
	// global.coins += 20;
	global.coins += money;
}
