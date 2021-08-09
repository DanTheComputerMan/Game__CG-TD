event_inherited();
if(hp <= 0) {
	var new_enemy_zebra1 = instance_create_depth(x,y,-1,oEnemyZebra);
	new_enemy_zebra1.path_position = path_position;
	new_enemy_zebra1.parentEnemy = parentEnemy;
	new_enemy_zebra1.bulletsReceived = bulletsReceived;
	var new_enemy_zebra2 = instance_create_depth(x,y,-1,oEnemyZebra);
	new_enemy_zebra2.path_position = max(path_position - global.enemyChildrenSpacing, 0);
	new_enemy_zebra2.parentEnemy = parentEnemy;
	new_enemy_zebra2.bulletsReceived = bulletsReceived;
	
	
	var num = abs(hp); // Gets remaining damage if any.
	var half_num = floor(abs(hp / 2)); // Halves the damage
	var remainder = floor(abs(hp) - (half_num * 2)); // Gets the extra 1-2 damage if any to add on.
	if (layers) {
		new_enemy_zebra1.hp -= half_num + remainder; new_enemy_zebra1.layers = true;
		new_enemy_zebra2.hp -= half_num; new_enemy_zebra2.layers = true;
	}
	if (num == 0) {
		new_enemy_zebra1.layers = false;
		new_enemy_zebra2.layers = false;
	}
	//instance_destroy();
}