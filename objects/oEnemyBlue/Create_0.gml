event_inherited();
/// @description Insert description here
// You can write your code in this editor

// hp = global.hp;
hp = 1;
max_hp = 1;
money = 1;
spd = 1.1 * global.spdModifier;
livesCost = 2;
type = "blue";
tier = 2;
escaped = false;

path_start(path0,spd,0,1);

//show_debug_message(variable_instance_exists(self, "parentEnemy"));

//if (!variable_instance_exists(self, "parentEnemy")) {
//	parentEnemy = self;
//}

//if (!variable_instance_exists(self, "bulletsReceived")) {
//	self.bulletsReceived = ds_list_create();
//}