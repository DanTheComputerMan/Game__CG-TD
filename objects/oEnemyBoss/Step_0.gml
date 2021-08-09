event_inherited();
if(hp <= 0) {
	var new_enemy_ceramic1 = instance_create_depth(x,y,-1,oEnemyCeramic);
	new_enemy_ceramic1.path_position = path_position;
	new_enemy_ceramic1.parentEnemy = parentEnemy;
	new_enemy_ceramic1.bulletsReceived = bulletsReceived;
	var new_enemy_ceramic2 = instance_create_depth(x,y,-1,oEnemyCeramic);
	new_enemy_ceramic2.path_position = max(path_position - global.enemyChildrenSpacing, 0);
	new_enemy_ceramic2.parentEnemy = parentEnemy;
	new_enemy_ceramic2.bulletsReceived = bulletsReceived;
	var new_enemy_ceramic3 = instance_create_depth(x,y,-1,oEnemyCeramic);
	new_enemy_ceramic3.path_position = max(path_position - global.enemyChildrenSpacing*2, 0);
	new_enemy_ceramic3.parentEnemy = parentEnemy;
	new_enemy_ceramic3.bulletsReceived = bulletsReceived;
	var new_enemy_ceramic4 = instance_create_depth(x,y,-1,oEnemyCeramic);
	new_enemy_ceramic4.path_position = max(path_position - global.enemyChildrenSpacing*3, 0);
	new_enemy_ceramic4.parentEnemy = parentEnemy;
	new_enemy_ceramic4.bulletsReceived = bulletsReceived;
	
	
	var num = abs(hp); // Gets remaining damage if any.
	var quarter_num = floor(abs(hp / 4)); // Quarters the damage
	var remainder = floor(abs(hp) - (quarter_num * 4)); // Gets the extra 1-2 damage if any to add on.
	if (layers) {
		new_enemy_ceramic1.hp -= quarter_num + remainder; new_enemy_ceramic1.layers = true;
		new_enemy_ceramic2.hp -= quarter_num; new_enemy_ceramic2.layers = true;
		new_enemy_ceramic3.hp -= quarter_num; new_enemy_ceramic3.layers = true;
		new_enemy_ceramic4.hp -= quarter_num; new_enemy_ceramic4.layers = true;
	}
	if (num == 0) {
		new_enemy_ceramic1.layers = false;
		new_enemy_ceramic2.layers = false;
		new_enemy_ceramic3.layers = false;
		new_enemy_ceramic4.layers = false;
	}
	//instance_destroy();
}