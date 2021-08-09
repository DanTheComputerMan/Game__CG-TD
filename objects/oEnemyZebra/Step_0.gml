event_inherited();
if(hp <= 0) {
	var new_enemy_white = instance_create_depth(x,y,-1,oEnemyWhite);
	new_enemy_white.path_position = path_position;
	new_enemy_white.parentEnemy = parentEnemy;
	new_enemy_white.bulletsReceived = bulletsReceived;
	var new_enemy_black = instance_create_depth(x,y,-1,oEnemyBlack);
	new_enemy_black.path_position = max(path_position - global.enemyChildrenSpacing, 0);
	new_enemy_black.parentEnemy = parentEnemy;
	new_enemy_black.bulletsReceived = bulletsReceived;
	
	
	var num = abs(hp); // Gets remaining damage if any.
	var half_num = floor(abs(hp / 2)); // Halves the damage
	var remainder = floor(abs(hp) - (half_num * 2)); // Gets the extra 1-2 damage if any to add on.
	if (layers) {
		new_enemy_white.hp -= half_num + remainder; new_enemy_white.layers = true;
		new_enemy_black.hp -= half_num; new_enemy_black.layers = true;
	}
	if (num == 0) {
		new_enemy_white.layers = false;
		new_enemy_black.layers = false;
	}
	//instance_destroy();
}