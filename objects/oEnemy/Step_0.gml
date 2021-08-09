// Just the line below and nothing else in a child object is the same
// as not including the respective event in the child object.
// This uses code from parent event for that respective event.
// event_inherited();

// Each sprite like sprEnemyGoLeft is a seperate
// sprite on the right 'Assest Browser'.s
// show_debug_message(self);

if (!variable_instance_exists(self, "parentEnemy")) parentEnemy = self;

if(hp <= 0) {
	var num = max(remainingDamage - max_hp, 0);
	//with (oProjectileParent) {
	//	parentTower.damageDealt += num;
	//}
	
	//show_debug_message(parentTower);
	
	//parentTower.damageDealt += num;
	remainingDamage = num;
	instance_destroy();
}
if (path_position == 1) {
	escaped = true;
	//show_debug_message(livesCost);
	//global.lives_left--;
	global.lives_left -= livesCost;
	instance_destroy();
}

if (direction >= 306 or direction <= 45) {
	// Turn sprite left (right sprite).
	image_angle = 90
} else if (direction >= 46 and direction <= 135) {
	// Turn sprite up.
	image_angle = 180
} else if (direction >= 136 and direction <= 225) {
	// Turn sprite right (left sprite).
	image_angle = 270
} else if (direction >= 226 and direction <= 305) {
	// Turn sprite down (regular sprite).
	image_angle = 0
}