/// @description Insert description here
// You can write your code in this editor


alarm[1] = room_speed; // Originally room_speed * 5. I took it out 
// for almost immediate round end when last enemy is killed.

// if (instance_number(oEnemy) <= 0) { // round is over.
var tmp = global.rounds[$ global.difficulty];

//show_debug_message("enemyArrIndex");
//show_debug_message(enemyArrIndex);
//show_debug_message("tmp[global.level - 1]");
//show_debug_message(tmp[global.level - 1]);
//show_debug_message("array_length(tmp[global.level - 1])");
//show_debug_message(array_length(tmp[global.level - 1]));
if ((instance_number(oEnemy) <= 0) and (enemyArrIndex >= array_length(tmp[global.level - 1]))) {
	
	// global.coins += 100 + (2 * global.level);
	if (global.difficulty == "expert" or global.difficulty == "insane") global.coins += round((100 * global.level) / 3);
	global.coins += round(100 + (2 * global.level)); // Intentionally twice.
	
	
	//spawn_count = 0;
	//spawn_amount += 3; // Original spawn_amount++;
	global.level++;
	// global.spd += 0.35; // Original += 0.1
	// spawn_rate += 2.5; // Commented to test out less unpacked enemies.
	// alarm[0] = spawn_rate; // Temporarily commented to test out next round button.
	alarm[0] = -1;
	alarm[1] = -1;
	// global.stepBlock = true;
	
	// show_debug_message("spawn rate: " + string(spawn_rate));
	// show_debug_message("room speed: " + string(room_speed));
	
	// Enable next round button.
	bStartRound.sprite_index = sNextRoundButtonEnabled;
	
	
	enemySpacingWaitCounter = 0;
	enemyCounter = 0;
	enemyArrIndex = 0;
	enemyToSpawn = noone;
}