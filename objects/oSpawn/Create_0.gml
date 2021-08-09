/// @description Insert description here
// You can write your code in this editor

// room_speed default is 60, which I believe is once per second.

spawn_amount = 5;
spawn_count = 0;

spawned_enemies_arr = [];

// spawn_rate = 1 * room_speed;
// alarm[0] = 1;
// alarm[1] = room_speed * 5;
spawn_rate = 1 * room_speed;
enemySpacingWaitCounter = 0;
enemyCounterArr = [{count:1, wait:60}]; // default {count:1, wait:0} to avoid errors.
enemyCounterDsList = ds_list_create();
enemiesToSpawn = [];
enemyArrIndex = 0; // Counter for the index of the current global.rounds[diff][index]
enemyCounter = 0; // Counter for the 'count' property of the current global.rounds[diff][index].count
numEnemiesSpawnedThisRound = 0;
numEnemiesToSpawnThisRound = 0;
numEnemiesToSpawnThisRoundCheck = false;
enemyToSpawn = noone;
lastEnemySpawned = false;

alarm[0] = -1
alarm[1] = -1;

global.spdModifier = 1; // Original 1.
global.level = 1; // Original 1.
global.coins = 300;
global.lives_left = 10;

global.selectedTower = noone; // Sets the selected tower to no tower to start off.

global.stepBlock = true; // since spawn rounds was changed, this is to stop waves auto-starting when loading map.

global.rounds = {
	easy: [
		[{id:"red", count:10, spacing: 0.8}],
		[{id:"red", count:16, spacing: 0.7}],
		[{id:"red", count:8, spacing: 0.8}, {id:"blue", count:6, spacing: 0.9}],
		[{id:"red", count:12, spacing: 0.6}, {id:"blue", count:10, spacing: 0.8}],
		[{id:"blue", count:12, spacing: 0.6}], // 5
		[{id:"blue", count:30, spacing: 0.6}],
		[{id:"blue", count:8, spacing: 0.6}, {id:"green", count:6, spacing: 0.8}],
		[{id:"red", count:30, spacing: 0.4}, {id:"blue", count:14, spacing: 0.8}, {id:"green", count:4, spacing: 1}],
		[{id:"red", count:40, spacing: 0.1}, {id:"blue", count:8, spacing: 0.5}],
		[{id:"blue", count:15, spacing: 0.4}, {id:"green", count:15, spacing: 0.4}], // 10
		[{id:"green", count:20, spacing: 0.3}],
		[{id:"blue", count:12, spacing: 0.3}, {id:"yellow", count:8, spacing: 0.3}],
		[{id:"blue", count:40, spacing: 0.3}, {id:"green", count:8, spacing: 0.4}, {id:"yellow", count:12, spacing: 0.35}],
		[{id:"blue", count:65, spacing: 0.4}, {id:"green", count:14, spacing: 0.2}, {id:"yellow", count:12, spacing: 0.5}],
		[{id:"green", count:22, spacing: 0.3}, {id:"yellow", count:20, spacing: 0.2}], // 15
		[{id:"pink", count:12, spacing: 0.2}],
		[{id:"green", count:25, spacing: 0.4}, {id:"pink", count:12, spacing: 0.2}],
		[{id:"blue", count:20, spacing: 0.4}, {id:"green", count:20, spacing: 0.3}, {id:"black", count:8, spacing: 0.35}],
		[{id:"green", count:25, spacing: 0.25}, {id:"black", count:20, spacing: 0.3}],
		[{id:"black", count:25, spacing: 0.2}], // 20
		[{id:"blue", count:22, spacing: 0.375}, {id:"green", count:23, spacing: 0.275}, {id:"white", count:10, spacing: 0.325}],
		[{id:"green", count:30, spacing: 0.225}, {id:"white", count:25, spacing: 0.25}],
		[{id:"white", count:30, spacing: 0.175}],
		[{id:"zebra", count:8, spacing: 0.5}],
		[{id:"pink", count:30, spacing: 0.3}, {id:"zebra", count:14, spacing: 0.35}], // 25
		[{id:"yellow", count:100, spacing: 0.175}],
		[{id:"green", count:50, spacing: 0.2}, {id:"yellow", count:50, spacing: 0.2}],
		[{id:"black", count:30, spacing: 0.2}, {id:"white", count:30, spacing: 0.2}],
		[{id:"zebra", count:40, spacing: 0.4}],
		[{id:"rainbow", count:8, spacing: 0.38}], // 30
		[{id:"blue", count:100, spacing: 0.175}, {id:"rainbow", count:14, spacing: 0.35}],
		[{id:"pink", count:20, spacing: 0.3}, {id:"rainbow", count:20, spacing: 0.4}],
		[{id:"zebra", count:20, spacing: 0.38}, {id:"rainbow", count:20, spacing: 0.44}],
		[{id:"rainbow", count:50, spacing: 0.4}],
		[{id:"ceramic", count:8, spacing: 0.5}], // 35
		[{id:"black", count:30, spacing: 0.4}, {id:"zebra", count:30, spacing: 0.4}, {id:"rainbow", count:30, spacing: 0.6}],
		[{id:"zebra", count:20, spacing: 0.5}, {id:"ceramic", count:14, spacing: 0.5}],
		[{id:"pink", count:100, spacing: 0.2}, {id:"ceramic", count:14, spacing: 0.55}],
		[{id:"rainbow", count:50, spacing: 0.4}, {id:"ceramic", count:8, spacing: 0.5}],
		[{id:"boss", count:2, spacing: 8}], // 40
	],
	medium: [
		[{id:"red", count:12, spacing: 0.6}],
		[{id:"red", count:22, spacing: 0.5}],
		[{id:"red", count:12, spacing: 0.6}, {id:"blue", count:10, spacing: 0.8}],
		[{id:"red", count:18, spacing: 0.5}, {id:"blue", count:15, spacing: 0.6}],
		[{id:"blue", count:25, spacing: 0.5}], // 5
		[{id:"blue", count:40, spacing: 0.3}],
		[{id:"blue", count:15, spacing: 0.5}, {id:"green", count:10, spacing: 0.8}],
		[{id:"red", count:30, spacing: 0.3}, {id:"blue", count:24, spacing: 0.6}, {id:"green", count:8, spacing: 0.8}],
		[{id:"red", count:60, spacing: 0.1}, {id:"blue", count:14, spacing: 0.5}],
		[{id:"blue", count:25, spacing: 0.4}, {id:"green", count:20, spacing: 0.3}], // 10
		[{id:"green", count:30, spacing: 0.3}],
		[{id:"blue", count:18, spacing: 0.275}, {id:"yellow", count:12, spacing: 0.3}],
		[{id:"blue", count:55, spacing: 0.25}, {id:"green", count:14, spacing: 0.3}, {id:"yellow", count:15, spacing: 0.3}],
		[{id:"green", count:22, spacing: 0.2}, {id:"yellow", count:16, spacing: 0.45}],
		[{id:"green", count:30, spacing: 0.3}, {id:"yellow", count:30, spacing: 0.2}], // 15
		[{id:"pink", count:20, spacing: 0.175}],
		[{id:"green", count:35, spacing: 0.4}, {id:"pink", count:28, spacing: 0.175}],
		[{id:"green", count:20, spacing: 0.3}, {id:"black", count:14, spacing: 0.325}],
		[{id:"green", count:25, spacing: 0.25}, {id:"black", count:24, spacing: 0.3}],
		[{id:"black", count:32, spacing: 0.2}], // 20
		[{id:"green", count:30, spacing: 0.3}, {id:"white", count:14, spacing: 0.325}],
		[{id:"green", count:40, spacing: 0.225}, {id:"white", count:30, spacing: 0.275}],
		[{id:"white", count:50, spacing: 0.175}],
		[{id:"zebra", count:14, spacing: 0.475}],
		[{id:"pink", count:45, spacing: 0.5}, {id:"zebra", count:15, spacing: 0.35}], // 25
		[{id:"yellow", count:125, spacing: 0.125}],
		[{id:"green", count:60, spacing: 0.2}, {id:"yellow", count:60, spacing: 0.2}],
		[{id:"black", count:40, spacing: 0.2}, {id:"white", count:40, spacing: 0.2}],
		[{id:"zebra", count:40, spacing: 0.3}],
		[{id:"rainbow", count:14, spacing: 0.35}], // 30
		[{id:"yellow", count:50, spacing: 0.2}, {id:"rainbow", count:18, spacing: 0.35}],
		[{id:"pink", count:30, spacing: 0.2}, {id:"rainbow", count:25, spacing: 0.35}],
		[{id:"zebra", count:20, spacing: 0.4}, {id:"rainbow", count:25, spacing: 0.7}],
		[{id:"rainbow", count:50, spacing: 0.3}],
		[{id:"ceramic", count:14, spacing: 0.5}], // 35
		[{id:"black", count:30, spacing: 0.4}, {id:"zebra", count:30, spacing: 0.4}, {id:"rainbow", count:30, spacing: 0.7}],
		[{id:"zebra", count:20, spacing: 0.3}, {id:"ceramic", count:16, spacing: 0.5}],
		[{id:"pink", count:100, spacing: 0.18}, {id:"ceramic", count:14, spacing: 0.5}],
		[{id:"rainbow", count:30, spacing: 0.7}, {id:"ceramic", count:25, spacing: 0.4}],
		[{id:"boss", count:3, spacing: 7}], // 40
	],
	hard: [
		[{id:"red", count:20, spacing: 0.5}],
		[{id:"red", count:30, spacing: 0.35}],
		[{id:"red", count:20, spacing: 0.5}, {id:"blue", count:15, spacing: 0.65}],
		[{id:"red", count:28, spacing: 0.3}, {id:"blue", count:20, spacing: 0.45}],
		[{id:"blue", count:30, spacing: 0.4}], // 5
		[{id:"blue", count:42, spacing: 0.175}],
		[{id:"blue", count:24, spacing: 0.4}, {id:"green", count:15, spacing: 0.6}],
		[{id:"blue", count:24, spacing: 0.45}, {id:"green", count:22, spacing: 0.55}],
		[{id:"red", count:100, spacing: 0.1}, {id:"blue", count:25, spacing: 0.4}],
		[{id:"blue", count:35, spacing: 0.35}, {id:"green", count:30, spacing: 0.275}], // 10
		[{id:"green", count:40, spacing: 0.225}],
		[{id:"blue", count:30, spacing: 0.25}, {id:"yellow", count:18, spacing: 0.2}],
		[{id:"blue", count:70, spacing: 0.25}, {id:"green", count:20, spacing: 0.3}, {id:"yellow", count:20, spacing: 0.4}],
		[{id:"green", count:30, spacing: 0.2}, {id:"yellow", count:16, spacing: 0.35}],
		[{id:"green", count:50, spacing: 0.3}, {id:"yellow", count:30, spacing: 0.2}], // 15
		[{id:"pink", count:30, spacing: 0.15}],
		[{id:"green", count:30, spacing: 0.25}, {id:"pink", count:35, spacing: 0.175}],
		[{id:"green", count:32, spacing: 0.3}, {id:"black", count:16, spacing: 0.3}],
		[{id:"yellow", count:25, spacing: 0.25}, {id:"black", count:24, spacing: 0.3}],
		[{id:"black", count:40, spacing: 0.175}], // 20
		[{id:"yellow", count:30, spacing: 0.3}, {id:"white", count:14, spacing: 0.325}],
		[{id:"green", count:90, spacing: 0.215}, {id:"white", count:30, spacing: 0.275}],
		[{id:"white", count:50, spacing: 0.115}],
		[{id:"zebra", count:20, spacing: 0.355}],
		[{id:"pink", count:65, spacing: 0.3}, {id:"zebra", count:15, spacing: 0.3}], // 25
		[{id:"yellow", count:200, spacing: 0.09}],
		[{id:"green", count:60, spacing: 0.2}, {id:"pink", count:60, spacing: 0.2}],
		[{id:"black", count:50, spacing: 0.2}, {id:"white", count:50, spacing: 0.2}],
		[{id:"zebra", count:42, spacing: 0.27}],
		[{id:"rainbow", count:18, spacing: 0.35}], // 30
		[{id:"pink", count:50, spacing: 0.35}, {id:"rainbow", count:18, spacing: 0.35}],
		[{id:"black", count:30, spacing: 0.2}, {id:"rainbow", count:25, spacing: 0.35}],
		[{id:"zebra", count:35, spacing: 0.275}, {id:"rainbow", count:30, spacing: 0.25}],
		[{id:"rainbow", count:55, spacing: 0.18}],
		[{id:"ceramic", count:20, spacing: 0.3}], // 35
		[{id:"white", count:40, spacing: 0.3}, {id:"zebra", count:20, spacing: 0.1}, {id:"rainbow", count:40, spacing: 0.3}],
		[{id:"zebra", count:30, spacing: 0.2}, {id:"ceramic", count:20, spacing: 0.15}],
		[{id:"pink", count:150, spacing: 0.1}, {id:"ceramic", count:20, spacing: 0.3}],
		[{id:"rainbow", count:55, spacing: 0.2}, {id:"ceramic", count:10, spacing: 0.2}],
		[{id:"boss", count:3, spacing: 4}], // 40,
	],
	expert: [
		[{id:"red", count:25, spacing: 0.4}],
		[{id:"red", count:35, spacing: 0.25}],
		[{id:"red", count:30, spacing: 0.4}, {id:"blue", count:25, spacing: 0.55}],
		[{id:"red", count:38, spacing: 0.2}, {id:"blue", count:30, spacing: 0.35}],
		[{id:"blue", count:40, spacing: 0.3}], // 5
		[{id:"blue", count:52, spacing: 0.075}],
		[{id:"blue", count:34, spacing: 0.3}, {id:"green", count:25, spacing: 0.5}],
		[{id:"blue", count:34, spacing: 0.35}, {id:"green", count:35, spacing: 0.55}],
		[{id:"red", count:150, spacing: 0.05}, {id:"blue", count:35, spacing: 0.3}],
		[{id:"blue", count:45, spacing: 0.25}, {id:"green", count:40, spacing: 0.175}], // 10
		[{id:"green", count:50, spacing: 0.125}],
		[{id:"blue", count:40, spacing: 0.15}, {id:"yellow", count:25, spacing: 0.3}],
		[{id:"blue", count:70, spacing: 0.25}, {id:"green", count:30, spacing: 0.225}, {id:"yellow", count:30, spacing: 0.325}],
		[{id:"green", count:40, spacing: 0.1}, {id:"yellow", count:26, spacing: 0.25}],
		[{id:"green", count:60, spacing: 0.2}, {id:"yellow", count:40, spacing: 0.1}], // 15
		[{id:"pink", count:30, spacing: 0.05}],
		[{id:"green", count:40, spacing: 0.15}, {id:"pink", count:45, spacing: 0.075}],
		[{id:"green", count:42, spacing: 0.2}, {id:"black", count:26, spacing: 0.2}],
		[{id:"yellow", count:35, spacing: 0.15}, {id:"black", count:34, spacing: 0.2}],
		[{id:"black", count:50, spacing: 0.075}], // 20
		[{id:"yellow", count:40, spacing: 0.2}, {id:"white", count:24, spacing: 0.225}],
		[{id:"green", count:120, spacing: 0.115}, {id:"white", count:40, spacing: 0.175}],
		[{id:"white", count:75, spacing: 0.04}],
		[{id:"zebra", count:30, spacing: 0.255}],
		[{id:"pink", count:85, spacing: 0.2}, {id:"zebra", count:25, spacing: 0.2}], // 25
		[{id:"pink", count:200, spacing: 0.09}],
		[{id:"green", count:75, spacing: 0.1}, {id:"pink", count:75, spacing: 0.1}],
		[{id:"black", count:60, spacing: 0.1}, {id:"white", count:60, spacing: 0.1}],
		[{id:"zebra", count:52, spacing: 0.17}],
		[{id:"rainbow", count:28, spacing: 0.25}], // 30
		[{id:"pink", count:60, spacing: 0.2}, {id:"rainbow", count:28, spacing: 0.25}],
		[{id:"black", count:40, spacing: 0.1}, {id:"rainbow", count:35, spacing: 0.25}],
		[{id:"zebra", count:45, spacing: 0.175}, {id:"rainbow", count:40, spacing: 0.15}],
		[{id:"rainbow", count:80, spacing: 0.1}],
		[{id:"ceramic", count:30, spacing: 0.2}], // 35
		[{id:"white", count:50, spacing: 0.2}, {id:"zebra", count:30, spacing: 0.04}, {id:"rainbow", count:50, spacing: 0.2}],
		[{id:"zebra", count:40, spacing: 0.1}, {id:"ceramic", count:30, spacing: 0.05}],
		[{id:"pink", count:200, spacing: 0.04}, {id:"ceramic", count:30, spacing: 0.2}],
		[{id:"rainbow", count:70, spacing: 0.1}, {id:"ceramic", count:20, spacing: 0.1}],
		[{id:"boss", count:6, spacing: 4}], // 40,
	],
	insane: [
		[{id:"blue", count:25, spacing: 0.4}],
		[{id:"blue", count:35, spacing: 0.25}],
		[{id:"blue", count:30, spacing: 0.4}, {id:"green", count:25, spacing: 0.55}],
		[{id:"blue", count:38, spacing: 0.2}, {id:"green", count:30, spacing: 0.35}],
		[{id:"blue", count:40, spacing: 0.3}], // 5
		[{id:"green", count:52, spacing: 0.075}],
		[{id:"blue", count:34, spacing: 0.3}, {id:"green", count:25, spacing: 0.5}],
		[{id:"red", count:34, spacing: 0.35}, {id:"blue", count:34, spacing: 0.35}, {id:"green", count:32, spacing: 0.45}],
		[{id:"blue", count:150, spacing: 0.05}, {id:"yellow", count:35, spacing: 0.3}],
		[{id:"green", count:45, spacing: 0.25}, {id:"yellow", count:40, spacing: 0.175}], // 10
		[{id:"green", count:50, spacing: 0.125}],
		[{id:"blue", count:40, spacing: 0.15}, {id:"yellow", count:28, spacing: 0.1}],
		[{id:"yellow", count:90, spacing: 0.15}],
		[{id:"pink", count:40, spacing: 0.1}],
		[{id:"green", count:60, spacing: 0.2}, {id:"yellow", count:40, spacing: 0.1}], // 15
		[{id:"yellow", count:60, spacing: 0.2}, {id:"pink", count:40, spacing: 0.05}],
		[{id:"yellow", count:40, spacing: 0.15}, {id:"black", count:45, spacing: 0.075}],
		[{id:"pink", count:42, spacing: 0.2}, {id:"black", count:26, spacing: 0.2}],
		[{id:"yellow", count:35, spacing: 0.15}, {id:"white", count:34, spacing: 0.2}],
		[{id:"white", count:50, spacing: 0.075}], // 20
		[{id:"black", count:40, spacing: 0.2}, {id:"white", count:24, spacing: 0.225}],
		[{id:"zebra", count:120, spacing: 0.115}],
		[{id:"white", count:75, spacing: 0.04}, {id:"zebra", count:120, spacing: 0.115}],
		[{id:"zebra", count:30, spacing: 0.255}],
		[{id:"rainbow", count:85, spacing: 0.2}], // 25
		[{id:"pink", count:200, spacing: 0.09}],
		[{id:"zebra", count:75, spacing: 0.1}, {id:"rainbow", count:75, spacing: 0.1}],
		[{id:"black", count:60, spacing: 0.1}, {id:"zebra", count:60, spacing: 0.1}, {id:"rainbow", count:60, spacing: 0.1}],
		[{id:"rainbow", count:52, spacing: 0.17}],
		[{id:"ceramic", count:28, spacing: 0.25}], // 30
		[{id:"black", count:60, spacing: 0.1}, {id:"rainbow", count:28, spacing: 0.25}],
		[{id:"white", count:40, spacing: 0.1}, {id:"zebra", count:35, spacing: 0.25}],
		[{id:"zebra", count:45, spacing: 0.175}, {id:"ceramic", count:40, spacing: 0.15}],
		[{id:"rainbow", count:80, spacing: 0.1}, {id:"ceramic", count:80, spacing: 0.1}],
		[{id:"ceramic", count:30, spacing: 0.2}], // 35
		[{id:"boss", count:50, spacing: 0.2}],
		[{id:"zebra", count:45, spacing: 0.175}, {id:"rainbow", count:40, spacing: 0.1}, {id:"ceramic", count:30, spacing: 0.05}],
		[{id:"boss", count:200, spacing: 0.04}, {id:"rainbow", count:30, spacing: 0.2}],
		[{id:"boss", count:70, spacing: 0.1}, {id:"ceramic", count:20, spacing: 0.1}],
		[{id:"boss", count:6, spacing: 4}, {id:"ceramic", count:20, spacing: 0.1}, {id:"rainbow", count:20, spacing: 0.1}], // 40,
	]
};
//global.rounds = rd;

global.enemies = {
	red: oEnemyRed,
	blue: oEnemyBlue,
	green: oEnemyGreen,
	yellow: oEnemyYellow,
	pink: oEnemyPink,
	black: oEnemyBlack,
	white: oEnemyWhite,
	zebra: oEnemyZebra,
	rainbow: oEnemyRainbow,
	ceramic: oEnemyCeramic,
	boss: oEnemyBoss
}

global.difficulties = {
	easy: { // fully confirmed possible AND w/o any upgrades.
		spd: 1,
		level: 1, // 1
		coins: 250, // 250
		lives_left: 40,
		costModifier: 1,
		ceramicHPmodifier: 1,
		bossHPmodifier: 1
	},
	medium: { // fully confirmed possible AND w/o any upgrades.
		spd: 2,
		level: 3, // 3
		coins: 1000, // 1000
		lives_left: 30,
		costModifier: 1.8,
		ceramicHPmodifier: 1.5,
		bossHPmodifier: 2
	},
	hard: {
		spd: 3,
		level: 6,
		coins: 2000,
		lives_left: 15,
		costModifier: 3,
		ceramicHPmodifier: 2.5,
		bossHPmodifier: 4
	},
	expert: {
		spd: 5,
		level: 9, // 10
		coins: 15000, // 10500
		lives_left: 4,
		costModifier: 5,
		ceramicHPmodifier: 5,
		bossHPmodifier: 10
	},
	insane: {
		spd: 7,
		level: 15,
		coins: 30000,
		lives_left: 1,
		costModifier: 10,
		ceramicHPmodifier: 15,
		bossHPmodifier: 30
	},
	sandbox: {
		spd: 1,
		level: 1,
		coins: infinity,
		lives_left: infinity,
		costModifier: 1,
		ceramicHPmodifier: 1,
		bossHPmodifier: 1
	}
};
global.spdModifier += global.difficulties[$ global.difficulty].spd;
global.level = global.difficulties[$ global.difficulty].level;
global.coins = global.difficulties[$ global.difficulty].coins;
global.lives_left = global.difficulties[$ global.difficulty].lives_left;
global.costModifier = global.difficulties[$ global.difficulty].costModifier;
global.ceramicHPmodifier = global.difficulties[$ global.difficulty].ceramicHPmodifier;
global.bossHPmodifier = global.difficulties[$ global.difficulty].bossHPmodifier;

global.enemyChildrenSpacing = 0.004;