/// @description Insert description here
// You can write your code in this editor

if (global.stepBlock) exit; // To disable auto-start round.
if (bStartRound.sprite_index == sNextRoundButtonEnabled) exit; // Next round button is enabled.

var rnds = global.rounds[$ global.difficulty];

rnds = rnds[global.level - 1];

var tmp = noone;
var enemyCounterAdder = 0; var enemySpawned = false;

for (var i = 0; i < ds_list_size(enemyCounterDsList); i++) {
	tmp = ds_list_find_value(enemyCounterDsList, i);
	
	// Gets total number of enemies to spawn this round.
	if (!numEnemiesToSpawnThisRoundCheck) numEnemiesToSpawnThisRound += tmp.count;
	
	if (tmp.count <= 0) continue;
	if (tmp.spacing > 0) {
		tmp = json_parse(json_stringify(tmp)); // GM structs/objects also are a reference, like arrays.
		tmp.spacing--;
		ds_list_set(enemyCounterDsList, i, tmp);
		continue;
	}
	enemyCounterAdder++; // an enemy is going to be spawned.
	
	//show_debug_message(rnds[i]);
	
	tmp.count--;
	// tmp.spacing = rnds[i].spacing*60; // based on 60 fps
	tmp.spacing = rnds[i].spacing;
	
	enemyToSpawn = global.enemies[$ tmp.id]; // Get current enemy to spawn.
	numEnemiesSpawnedThisRound++;
	
	ds_list_set(enemyCounterDsList, i, tmp);
	array_push(enemiesToSpawn, enemyToSpawn); // Add enemy to enemy list.
	enemySpawned = true;
}
numEnemiesToSpawnThisRoundCheck = true;

// num enemies spawned and num enemies to spawn are the same, and no enemy spawned this round.
if (numEnemiesToSpawnThisRound == numEnemiesSpawnedThisRound and enemyCounterAdder == 0) enemyArrIndex = array_length(rnds);























// array_resize(enemiesToSpawn, 0); // clears the array.
// enemiesToSpawn = [];

//show_debug_message("step");
//show_debug_message(global.rounds[$ global.difficulty][global.level - 1]);
//for (var i = 0; i < array_length(enemyCounterArr); i++) {
//	//show_debug_message(enemyCounterArr);
	
//	if (enemyCounterArr[i].count <= 0) continue;
//	if (enemyCounterArr[i].spacing > 0) {
//		enemyCounterArr[i].spacing--;
//		continue;
//	}
	
//	var rnds = global.rounds[$ global.difficulty][global.level - 1];
//	enemyCounterArr[i].count--;
//	enemyToSpawn = global.enemies[$ enemyCounterArr[i].id]; // Get current enemy to spawn.
//	//show_debug_message(enemyCounterArr[i]);
//	//show_debug_message(rnds[i]);
//	enemyCounterArr[i].spacing = rnds[i].spacing*60; // based on 60 fps
//	array_push(enemiesToSpawn, enemyToSpawn); // Add enemy to enemy list.
	
	
//	//// Get rounds list.
//	//var rnds = global.rounds[$ global.difficulty];
//	//// Check if enemies still exist to spawn for the current level in rounds list.
//	//if ((global.level - 1) < array_length(rnds)) {
//	//	rnds = rnds[global.level - 1]; // Get enemies for that round.
//	//	enemyToSpawn = global.enemies[$ rnds[i].id]; // Get current enemy to spawn.
//	//	//show_debug_message(enemyCounterArr);
//	//	enemyCounterArr[i].spacing = rnds[i].spacing*60; // based on 60 fps
//	//	//show_debug_message(enemyCounterArr);
//	//	enemyCounterArr[i].count--;
//	//	array_push(enemiesToSpawn, enemyToSpawn); // Add enemy to enemy list.
//	//}
//}
alarm[0] = 1; // Send off all enemies to alarm[0] to spawn them.


//// show_debug_message("enemySpacingWaitCounter: " + string(enemySpacingWaitCounter));
//if (enemySpacingWaitCounter >= 0) {
//	enemySpacingWaitCounter--;
//} else {
//	if (bStartRound.sprite_index == sNextRoundButtonEnabled) exit;
//	var tmp = global.rounds[$ global.difficulty];
//	// Enemies still exist to spawn.
//	if (((global.level - 1) < array_length(tmp)) and (enemyArrIndex < array_length(tmp[global.level - 1]))) {
//		tmp = tmp[global.level - 1];
//		for (var i = 0; i < array_length(tmp); i++) {
//			show_debug_message(tmp[i]);
//		}
//		enemyToSpawn = global.enemies[$ tmp[enemyArrIndex].id];
//		enemySpacingWaitCounter = tmp[enemyArrIndex].spacing*60; // based on 60 fps
//		// show_debug_message("alarm[0] = 1");
//		alarm[0] = 1;
//		// show_debug_message("enemyCounter: " + string(enemyCounter) + "\t tmp[enemyArrIndex].count:" + string(tmp[enemyArrIndex].count));
//		if (enemyCounter == tmp[enemyArrIndex].count - 1) {
//			enemyArrIndex++;
//			enemyCounter = 0;
//		}
//		enemyCounter++;
//		if (enemyArrIndex) {
			
//		}
//	}
//}





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