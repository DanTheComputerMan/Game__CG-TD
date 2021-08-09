/// @description Insert description here
// You can write your code in this editor

var rnd = function(num, test) {
	return (random(num) > test ? random(num) : -random(num));
}

//show_debug_message("other: ");
//show_debug_message(other); // shows enemy struct.
//show_debug_message("other.properties: ");
//show_debug_message(json_stringify(other.properties)); // shows enemy struct. (Just shows 7 for some reason though.)

//if (properties.splash) { // If tower is a splash damage tower,
//	// Create oBomb__Blast object to check for collisions with surrounding enemies.
//	var b = instance_create_depth(other.x + rnd(properties.splashSize), other.y + rnd(properties.splashSize), -2, oBomb__Blast);
//	// Sets bomb's properties to the sub-bomb.
//	b.properties = properties;
	
//	// If tower has knockback, then knock the enemy back down the track by the knockback amount.
//	if (properties.knockback) other.path_position -= properties.knockbackAmount;
	
//	// Decreases own bomb's pierce by 1.
//	properties.pierce--
//	// Exit as the following code concerns non bomb projectiles.
//	exit;
//}

//// If ds_list doesn't have enemy's ref id, deal damage. This is used so the same projectile won't kill a 2+ layers of enemies of a 
//// single enemy in the same projectile (killing red spawned by killing blue, for example).
//if (ds_list_find_index(other.bulletsReceived, id) == -1) {
//	ds_list_add(other.bulletsReceived, id); // Add enemy's ref id to ds list.
	
//	// If projectile's pierce count is less than or equal to 1 (out of pierce), then destroy the projectile and exit.
//	if (properties.pierce <= 0) { instance_destroy(); exit; }
	
//	// Currently has a bug of only dealing 1 damage if dmg is > than other.hp (ceramic/boss). All others are fine.
//	parentTower.properties.damageDealt += max(min(other.hp - properties.damage, properties.damage), 1);
	
//	// Decreases enemy's hp by projectile's damage.
//	other.hp -= properties.damage;
//	// In case enemy dies as a result of the damage, set the enemy's layers property to the projectile's layers property so if the 
//	// projectile has the layers property set to true, it will deal layer damage to the child enemies.
//	other.layers = properties.layers; // boolean.
	
//	// Enemy has been encountered, so reduce pierce by 1.
//	properties.pierce--;
	
	
	
	
	
	
	
	
//	//distance_to_object(other)
	
//	//var empty = instance_create_depth(other.x, other.y, -1, empty_object);
//	//empty.width = 10; empty.height = 10;
//	//if (collision_circle(other.x, other.y, 10, id, 0, 0)) {
		
//	//}
	
//	with (oEnemy) {
//		//show_debug_message(collision_circle(other.x, other.y, 10, id, 0, 0));
//		// Implement this somehow for the bomb tower as it deals splash damage.
//		//if (collision_circle(other.x, other.y, 10, id, 0, 0)) {
//		//	hp -= 1;
//		//}
//	}
	
//	// the vLayers false will have to be bugged for now, as I don't yet know a way to calculate hp of all applicable children as well.
//	var dLayers = (other.hp - properties.damage >= 0) ? properties.damage : other.hp
//	var dNoLayers = (other.hp - properties.damage >= 0) ? properties.damage : other.hp;
	
//	//parentTower.damageDealt += (layers) ? dLayers : dNoLayers;
//	// has a bug of only dealing 1 damage if dmg is > than other.hp (ceramic/boss). All others are fine.
//	parentTower.properties.damageDealt += max(min(other.hp - properties.damage, properties.damage), 1);
//	other.hp -= properties.damage;
//	other.layers = properties.layers; // boolean.
	
//	//self.pierce--;
//	properties.pierce--;
	
//	// if (properties.super.knockback) other.path_position -= properties.super.knockbackAmount;
//	if (properties.knockback) other.path_position -= properties.knockbackAmount;
//}
////if (self.pierce <= 0) {
//if (properties.pierce <= 0) {
//	instance_destroy();
//}