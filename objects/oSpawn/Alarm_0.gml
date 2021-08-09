if (array_length(enemiesToSpawn) <= 0) exit;

for (var i = 0; i < array_length(enemiesToSpawn); i++) {
	if (enemiesToSpawn[i] != noone) instance_create_depth(x,y,-1,enemiesToSpawn[i]);
}
enemiesToSpawn = []; // Empty the array since we're done.


//if (enemyToSpawn != noone) instance_create_depth(x,y,-1,enemyToSpawn);


/// @description Insert description here
// You can write your code in this editor

// If there are still more enemies to spawn,
/*
if(spawn_count < spawn_amount){
	// Create enemy.
	instance_create_depth(x,y,-1,oEnemyRed);
	
	// global.rounds[global.values.difficulty][global.values.roundIndex];
	// global.values.roundIndex++;
	
	spawn_count++;
	// Amount of time till the next enemy spawns.
	alarm[0] = spawn_rate;
}
*/

//var tmp = global.rounds[$ global.difficulty][global.level - 1];
//for (var i = 0; i < array_length(tmp); i++) {
//	for (var j = 0; j < tmp[i].count; j += 1) {
//		show_debug_message("i: " + string(i) + "\tj: " + string(j));
//		instance_create_depth(x,y,-1,global.enemies[$ tmp[i].id]);
//		show_debug_message(alarm[0]);
//		alarm[0] = tmp[i].spacing*1000;
//		show_debug_message(alarm[0]);
//	}
//}
//alarm[0] = -1;