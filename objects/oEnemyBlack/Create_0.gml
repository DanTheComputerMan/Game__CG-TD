event_inherited();
/// @description Insert description here
// You can write your code in this editor

hp = 1;
max_hp = 1;
money = 1;
spd = 1.22 * global.spdModifier;
livesCost = 6;
type = "black";
tier = 6;
escaped = false;

//array_push(properties.types, "black");
ds_list_add(properties.types, "black");

path_start(path0,spd,0,1);