properties = {};
properties.cost = 200 * global.costModifier; // 200 * g

event_inherited();

properties.tower = "dart";
properties.range = 100;
properties.orig_range = 100;
properties.damage = 1;
properties.pierce = 2;
properties.fire_rate = room_speed / 1.1;
properties.orig_fire_rate = room_speed / 1.1;
properties.projectile_speed = 10;

//array_push(damageTypes, "sharp");
ds_list_add(properties.damageTypes, "black");
ds_list_add(properties.damageTypes, "white");
ds_list_add(properties.damageTypes, "grounded");
ds_list_add(properties.damageTypes, "baked");
ds_list_add(properties.damageTypes, "glass");
ds_list_add(properties.damageTypes, "warded");
ds_list_add(properties.damageTypes, "solvent");

// g.properties.fire_rate = g.properties.orig_fire_rate * (1/1.15); 

upgrades = [
	[{thumbnail: -1, text: "Quick attacks", description: "Tower attacks 15% faster.", locked:false, cost:150, 
			func: function() {var g = global.selectedTower; if (global.coins < (150 * global.costModifier) || g.upgrades[0][0].locked) {exit}; global.coins -= 150 * global.costModifier; g.properties.fire_rate *= (1/1.15); g.purchasedUpgrades[0] = 1; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "Rapid attacks", description: "Tower attacks 33% faster.", locked:false, cost:325, 
			func: function() {var g = global.selectedTower; if (global.coins < (325 * global.costModifier) || g.upgrades[0][1].locked) {exit}; global.coins -= 325 * global.costModifier; g.properties.fire_rate *= (1/1.33); g.purchasedUpgrades[0] = 2; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "Fast attacks", description: "Tower attacks 75% faster.", locked:false, cost:475, 
			func: function() {var g = global.selectedTower; if (global.coins < (475 * global.costModifier) || g.upgrades[0][2].locked) {exit}; global.coins -= 475 * global.costModifier; g.properties.fire_rate *= (1/1.75); g.purchasedUpgrades[0] = 3; g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "More range", description: "Tower gains +10% range.", locked:false, cost:400, 
			func: function() {var g = global.selectedTower; if (global.coins < (400 * global.costModifier) || g.upgrades[1][0].locked) {exit}; global.coins -= 400 * global.costModifier; g.properties.range *= 1.1; g.purchasedUpgrades[1] = 1; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "Big range", description: "Tower gains +15% range.", locked:false, cost:600, 
			func: function() {var g = global.selectedTower; if (global.coins < (600 * global.costModifier) || g.upgrades[1][1].locked) {exit}; global.coins -= 600 * global.costModifier; g.properties.range *= 1.15; g.purchasedUpgrades[1] = 2; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "Large range", description: "Tower gains +15% range.", locked:false, cost:1000, 
			func: function() {var g = global.selectedTower; if (global.coins < (1000 * global.costModifier) || g.upgrades[1][2].locked) {exit}; global.coins -= 1000 * global.costModifier; g.properties.range *= 1.15; g.purchasedUpgrades[1] = 3; g.upgrades[0][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "+1 pierce", description: "Tower gains +1 pierce.", locked:false, cost:350, 
			func: function() {var g = global.selectedTower; if (global.coins < (350 * global.costModifier) || g.upgrades[2][0].locked) {exit}; global.coins -= 350 * global.costModifier; g.properties.pierce += 1; g.purchasedUpgrades[2] = 1; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "+2 pierce", description: "Tower gains +2 pierce.", locked:false, cost:650, 
			func: function() {var g = global.selectedTower; if (global.coins < (650 * global.costModifier) || g.upgrades[2][1].locked) {exit}; global.coins -= 650 * global.costModifier; g.properties.pierce += 2; g.purchasedUpgrades[2] = 2; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "+2 darts", description: "(WIP) Tower now throws 3 darts instead of 1.", locked:false, cost:1450, 
			func: function() {var g = global.selectedTower; if (global.coins < (1450 * global.costModifier) || g.upgrades[2][2].locked) {exit}; global.coins -= 1450 * global.costModifier; var tmp = "NEED TO ADD THIS IN!"; g.purchasedUpgrades[2] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Anti-frozen", description: "Tower can now damage frozen enemies.", locked:false, cost:100,																	// array_push(g.damageTypes, "frozen");
			func: function() {var g = global.selectedTower; if (global.coins < (100 * global.costModifier) || g.upgrades[3][0].locked) {exit}; global.coins -= 100 * global.costModifier; ds_list_add(g.properties.damageTypes, "frozen"); g.purchasedUpgrades[3] = 1; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "Anti-camo", description: "Tower can now see and damage camo enemies.", locked:false, cost:250, 
			func: function() {var g = global.selectedTower; if (global.coins < (250 * global.costModifier) || g.upgrades[3][1].locked) {exit}; global.coins -= 250 * global.costModifier; ds_list_add(g.properties.damageTypes, "camo"); g.purchasedUpgrades[3] = 2; g.updateUpgrades();}}, 
		{thumbnail: -1, text: "Anti-lead", description: "Tower can now damage lead enemies.", locked:false, cost:600, 
			func: function() {var g = global.selectedTower; if (global.coins < (600 * global.costModifier) || g.upgrades[3][2].locked) {exit}; global.coins -= 600 * global.costModifier; ds_list_add(g.properties.damageTypes, "lead"); g.purchasedUpgrades[3] = 3;  g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true; g.updateUpgrades();}}]
];


projectile = oBullet;
sound = sndDartTowerShoot;