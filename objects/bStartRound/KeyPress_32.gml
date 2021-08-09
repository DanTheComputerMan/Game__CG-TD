/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sNextRoundButtonEnabled) {
	var tmp = noone;
	
	var rnds = global.rounds[$ global.difficulty];
	if ((global.level - 1) >= array_length(rnds)) exit; // No more levels exist.
	
	rnds = rnds[global.level - 1];
	// Re-set enemyCounterArr to the current wave of enemies so new enemies can be spawned.
	//array_copy(oSpawn.enemyCounterArr, 0, rnds, 0, array_length(rnds));
	
	for (var i = 0; i < array_length(rnds); i++) { // Originally array_length(oSpawn.enemyCounterArr)
		tmp = rnds[i]; tmp.spacing *= 60;
		
		ds_list_set(oSpawn.enemyCounterDsList, i, tmp);
	}
	oSpawn.numEnemiesToSpawnThisRoundCheck = false;
	oSpawn.numEnemiesToSpawnThisRound = 0;
	oSpawn.numEnemiesSpawnedThisRound = 0;
	
	oSpawn.alarm[1] = 60;
	global.stepBlock = false;
	
	// Disable button.
	sprite_index = sNextRoundButtonDisabled;
}