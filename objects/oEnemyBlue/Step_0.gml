event_inherited();

if(hp <= 0) {
	var new_enemy = instance_create_depth(x,y,-1,oEnemyRed);
	new_enemy.path_position = path_position;
	
	new_enemy.parentEnemy = parentEnemy;
	
	new_enemy.parentEnemy = parentEnemy;
	new_enemy.bulletsReceived = bulletsReceived;
	
	var num = abs(hp); // Gets remaining damage if any.
	if (layers) { new_enemy.hp -= num; new_enemy.layers = true; }
	if (num == 0) new_enemy.layers = false;
	//instance_destroy();
}