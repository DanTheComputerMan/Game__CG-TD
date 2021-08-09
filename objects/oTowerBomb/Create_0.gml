properties = {};
properties.cost = 300 * global.costModifier;

event_inherited();

properties.tower = "bomb";
properties.range = 80;
properties.orig_range = 80;
properties.damage = 1;
properties.pierce = 3;
properties.fire_rate = room_speed / 2;
properties.orig_fire_rate = room_speed / 2;
properties.projectile_speed = 14;

//array_push(damageTypes, "explosion"); // black
ds_list_add(properties.damageTypes, "white");
ds_list_add(properties.damageTypes, "ice");
ds_list_add(properties.damageTypes, "lead");
ds_list_add(properties.damageTypes, "grounded");
ds_list_add(properties.damageTypes, "baked");
ds_list_add(properties.damageTypes, "glass");
ds_list_add(properties.damageTypes, "warded");
ds_list_add(properties.damageTypes, "solvent");
ds_list_add(properties.damageTypes, "shield");
ds_list_add(properties.damageTypes, "shield_white");
ds_list_add(properties.damageTypes, "shield_ice");
ds_list_add(properties.damageTypes, "shield_lead");
ds_list_add(properties.damageTypes, "shield_grounded");
ds_list_add(properties.damageTypes, "shield_baked");
ds_list_add(properties.damageTypes, "shield_glass");
ds_list_add(properties.damageTypes, "shield_warded");
ds_list_add(properties.damageTypes, "shield_solvent");

projectile = oBomb;
sound = sndBombTowerShoot;

properties.splash = true;
properties.splashSize = 5;

upgrades = [
	[{thumbnail: -1, text: "Bigger Bombs", description: "Tower gains +2 pierce and a larger blast area.", locked:false, cost:500, 
		func: function() {var g = global.selectedTower; if (global.coins < (500 * global.costModifier) || g.upgrades[0][0].locked) {exit}; global.coins -= 500 * global.costModifier; g.properties.pierce += 2; g.properties.splashSize += 3; g.purchasedUpgrades[0] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Stronger Bombs", description: "Tower gains +1 damage and can damage through layers.", locked:false, cost:1200, 
		func: function() {var g = global.selectedTower; if (global.coins < (1200 * global.costModifier) || g.upgrades[0][1].locked) {exit}; global.coins -= 1200 * global.costModifier; g.properties.damage += 1; g.properties.layers = true; g.purchasedUpgrades[0] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Large Bombs", description: "Tower gains +2 damage and +5 pierce.", locked:false, cost:2000, 
		func: function() {var g = global.selectedTower; if (global.coins < (2000 * global.costModifier) || g.upgrades[0][2].locked) {exit}; global.coins -= 2000 * global.costModifier; g.properties.damage += 2; g.properties.pierce += 5; g.properties.splashSize += 8; g.purchasedUpgrades[0] = 3; g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Quick attacks", description: "Tower fires 15% faster.", locked:false, cost:300, 
		func: function() {var g = global.selectedTower; if (global.coins < (300 * global.costModifier) || g.upgrades[1][0].locked) {exit}; global.coins -= 300 * global.costModifier; g.properties.fire_rate *= 1/1.15; g.purchasedUpgrades[1] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Rapid attacks", description: "Tower fires 20% faster.", locked:false, cost:600, 
		func: function() {var g = global.selectedTower; if (global.coins < (600 * global.costModifier) || g.upgrades[1][1].locked) {exit}; global.coins -= 600 * global.costModifier; g.properties.fire_rate *= 1/1.2; g.purchasedUpgrades[1] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Boomin' attacks", description: "Tower fires 25% faster.", locked:false, cost:1500, 
		func: function() {var g = global.selectedTower; if (global.coins < (1500 * global.costModifier) || g.upgrades[1][2].locked) {exit}; global.coins -= 1500 * global.costModifier; g.properties.fire_rate *= 1/1.25; g.purchasedUpgrades[1] = 3; g.upgrades[0][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "More range", description: "Tower has 33% increased range.", locked:false, cost:500, 
		func: function() {var g = global.selectedTower; if (global.coins < (500 * global.costModifier) || g.upgrades[2][0].locked) {exit}; global.coins -= 500 * global.costModifier; g.properties.range *= 1.33; g.purchasedUpgrades[2] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Big range", description: "Tower has 66% increased range.", locked:false, cost:1200, 
		func: function() {var g = global.selectedTower; if (global.coins < (1200 * global.costModifier) || g.upgrades[2][1].locked) {exit}; global.coins -= 1200 * global.costModifier; g.properties.range *= 1.66; g.purchasedUpgrades[2] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Large range", description: "Tower has 100% increased range.", locked:false, cost:2000, 
		func: function() {var g = global.selectedTower; if (global.coins < (2000 * global.costModifier) || g.upgrades[2][2].locked) {exit}; global.coins -= 2000 * global.costModifier; g.properties.range *= 2; g.purchasedUpgrades[2] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Frags", description: "Tower fires fragments from it's explosion, damaging more enemies.", locked:false, cost:150, 
		func: function() {var g = global.selectedTower; if (global.coins < (150 * global.costModifier) || g.upgrades[3][0].locked) {exit}; global.coins -= 150 * global.costModifier; var tmp = "I NEED TO ADD THIS IN!"; g.purchasedUpgrades[3] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Anti-black", description: "Tower can now damage enemies with the black property.", locked:false, cost:550, 
		func: function() {var g = global.selectedTower; if (global.coins < (550 * global.costModifier) || g.upgrades[3][1].locked) {exit}; global.coins -= 550 * global.costModifier; ds_list_add(g.properties.damageTypes, "black"); ds_list_add(g.properties.damageTypes, "black_shield"); g.purchasedUpgrades[3] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Special explosions", description: "Causes attacks to affect all enemies, and do +9x damage to bosses.", locked:false, cost:4000, 
		func: function() {var g = global.selectedTower; if (global.coins < (4000 * global.costModifier) || g.upgrades[3][2].locked) {exit}; global.coins -= 4000 * global.costModifier; g.properties.buffs.toBossMulti += 9; g.purchasedUpgrades[3] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true; g.updateUpgrades();}}],
];