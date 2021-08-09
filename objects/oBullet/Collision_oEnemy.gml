/// @description Insert description here
// You can write your code in this editor
//show_debug_message(other);
if (ds_list_find_index(other.bulletsReceived, id) == -1) { // if ds list doesn't have enemy's ref id, deal damage.
	// ds_list_add(testDsList, id); // Add enemy's ref id to ds list.
	ds_list_add(other.bulletsReceived, id); // Add enemy's ref id to ds list.
	
	//if (layers) {
	//	if (other.hp - damage >= 0) {
	//		damage;
	//	} else {
	//		damage;
	//	}
	//} else {
	//	if (other.hp - damage >= 0) {
	//		damage;
	//	} else {
	//		other.hp;
	//	}
	//}
	
	
	
	//var dLayers = layers ? (other.hp - damage >= 0) ? damage : damage : (other.hp - damage >= 0) ? damage : other.hp;
	var dLayers = (other.hp - damage >= 0) ? damage : other.hp
	var dNoLayers = (other.hp - damage >= 0) ? damage : other.hp;
	// layers don't exist? damage to bloon only.
	//parentTower.damageDealt += layers ? damage : max(other.hp - damage, 1);
	//parentTower.damageDealt += layers ? max(other.hp - damage, 1) : (other.hp - damage >= 0) ? damage : (damage - other.hp);
	//parentTower.damageDealt += !layers ? (other.hp - damage >= 0) ? damage : other.hp : (other.hp - damage >= 0) ? damage : damage;
	parentTower.damageDealt += (layers) ? dLayers : dNoLayers;
	other.hp -= damage;
	other.layers = layers; // boolean.
	
	self.pierce--;
	
	// if (properties.super.knockback) other.path_position -= properties.super.knockbackAmount;
	other.path_position -= 0.003;
}
if (self.pierce <= 0) {
	instance_destroy();
}


var this = self;
//with(oEnemy) {
//show_debug_message(self);
with (oEnemy) {
	//show_debug_message(ds_list_find_index(this.testDsList, self.id));
	//if (ds_list_find_index(this.testDsList, id) == -1) { // if ds list doesn't have enemy's ref id, deal damage.
	//	ds_list_add(this.testDsList, id); // Add enemy's ref id to ds list.
	//	oEnemy.hp -= this.damage;
	//}
	
	
	
	
	
	
	//for (var i = 0; i < array_length(this.collisions); i++) {
	//	//show_debug_message(this.collisions[i]);
	//	show_debug_message(self.id);
	//	if (this.collisions[i] == self.parentEnemy) {
	//		exit; // To not damage the enemy again.
	//	}
	//}
	//array_push(this.collisions, self.parentEnemy);
}

// Potential way of implementing pierce.
//self.pierce--;
//if (self.pierce <= 0) {
//	instance_destroy();
//}
//}