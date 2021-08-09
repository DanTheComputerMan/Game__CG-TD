layers = false;

type = ""; // red, blue, green, etc.

//properties = ds_list_create();
properties = {
	//immunities: [], // "sharp", "explosion", "lightning", "magic", etc
	//types: []
	types: ds_list_create() // "black", "white", "ice", "camo", "lead", "grounded", etc
};

/// @description Insert description here
// You can write your code in this editor

// This is to track the tree upwards, so bullets can insta-kill the whole tree.
if (!variable_instance_exists(self, "remainingDamage")) {
	remainingDamage = 0;
}
// This is to track the tree upwards, so bullets can insta-kill the whole tree.
//if (!variable_instance_exists(self, "parentEnemy")) {
//	//parentEnemy = id;
//	parentEnemy = self;
//}
//parentEnemy = noone;

//if (!variable_instance_exists(self, "bulletsReceived")) {
//	self.bulletsReceived = id;
//}
if (!variable_instance_exists(self, "bulletsReceived")) {
	bulletsReceived = ds_list_create();
}
//show_debug_message(bulletsReceived);