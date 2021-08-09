event_inherited();
/// @description Insert description here
// You can write your code in this editor

hp = 1;
max_hp = 1;
money = 1;
spd = 1.45 * global.spdModifier;
livesCost = 13; // 6 black + 6 white + zebra layer.
type = "zebra";
tier = 7;
escaped = false;

//array_push(properties.types, "black");
//array_push(properties.types, "white");
ds_list_add(properties.types, "black");
ds_list_add(properties.types, "white");

path_start(path0,spd,0,1);