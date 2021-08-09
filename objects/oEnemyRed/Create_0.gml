event_inherited();
/// @description Insert description here
// You can write your code in this editor

hp = 1;
max_hp = 1;
money = 1;
spd = 1 * global.spdModifier;
livesCost = 1;
type = "red";
tier = 1;
escaped = false;

path_start(path0,spd,0,1);
// hp = global.hp;

if (!variable_instance_exists(self, "parentEnemy")) {
	parentEnemy = self;
}