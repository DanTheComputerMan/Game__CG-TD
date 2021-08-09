event_inherited();
/// @description Insert description here
// You can write your code in this editor

type = "BOSS";

hp = 200 * global.bossHPmodifier;
max_hp = 200 * global.bossHPmodifier;
money = 5;
spd = 1.18 * global.spdModifier;
livesCost = 200; // (40 for each ceramic * 4) + 40 for boss layer.
type = "boss";
tier = 8;
escaped = false;

path_start(path0,spd,0,1);