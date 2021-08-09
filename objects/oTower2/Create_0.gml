properties = {};
properties.cost = 300 * global.costModifier;

event_inherited();

properties.tower = "lightning";
properties.range = 50;
properties.orig_range = 50;
properties.damage = 2;
properties.pierce = 1;
properties.fire_rate = room_speed / 6;
properties.orig_fire_rate = room_speed / 6;
properties.projectile_speed = 20;

//array_push(damageTypes, "lightning");
//array_push(damageTypes, "energy");
ds_list_add(properties.damageTypes, "black");
ds_list_add(properties.damageTypes, "white");
ds_list_add(properties.damageTypes, "baked");
ds_list_add(properties.damageTypes, "glass");
ds_list_add(properties.damageTypes, "warded");
ds_list_add(properties.damageTypes, "solvent");
ds_list_add(properties.damageTypes, "shield");
ds_list_add(properties.damageTypes, "black_shield");
ds_list_add(properties.damageTypes, "white_shield");
ds_list_add(properties.damageTypes, "glass_shield");
ds_list_add(properties.damageTypes, "solvent_shield");

upgrades = [
																																													// g.fire_rate = g.orig_fire_rate * (1/1.2);
	[{thumbnail: -1, text: "Quick attacks", description: "Tower fires 10% faster.", locked:false, cost:300, 
		func: function() {var g = global.selectedTower; if (global.coins < (300 * global.costModifier) || g.upgrades[0][0].locked) {exit}; global.coins -= 300 * global.costModifier; g.properties.fire_rate *= (1/1.1); g.purchasedUpgrades[0] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Rapid attacks", description: "Tower fires 20% faster.", locked:false, cost:600, 
		func: function() {var g = global.selectedTower; if (global.coins < (600 * global.costModifier) || g.upgrades[0][1].locked) {exit}; global.coins -= 600 * global.costModifier; g.properties.fire_rate *= (1/1.2); g.purchasedUpgrades[0] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Blazing attacks", description: "Tower fires 100% faster.", locked:false, cost:1500, 
		func: function() {var g = global.selectedTower; if (global.coins < (1500 * global.costModifier) || g.upgrades[0][2].locked) {exit}; global.coins -= 1500 * global.costModifier; g.properties.fire_rate *= (1/2.0); g.purchasedUpgrades[0] = 3; g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "More range", description: "Tower gains +33% range.", locked:false, cost:500, 
		func: function() {var g = global.selectedTower; if (global.coins < (500 * global.costModifier) || g.upgrades[1][0].locked) {exit}; global.coins -= 500 * global.costModifier; g.properties.range *= 1.33; g.purchasedUpgrades[1] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Big range", description: "Tower gains +20% range.", locked:false, cost:1200, 
		func: function() {var g = global.selectedTower; if (global.coins < (1200 * global.costModifier) || g.upgrades[1][1].locked) {exit}; global.coins -= 1200 * global.costModifier; g.properties.range *= 1.2; g.purchasedUpgrades[1] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Large range", description: "Tower gains +33% increased range.", locked:false, cost:2000, 
		func: function() {var g = global.selectedTower; if (global.coins < (2000 * global.costModifier) || g.upgrades[1][2].locked) {exit}; global.coins -= 2000 * global.costModifier; g.properties.range *= 1.33; g.purchasedUpgrades[1] = 3; g.upgrades[0][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "+2 damage", description: "Tower gains +2 damage.", locked:false, cost:500, 
		func: function() {var g = global.selectedTower; if (global.coins < (500 * global.costModifier) || g.upgrades[2][0].locked) {exit}; global.coins -= 500 * global.costModifier; g.properties.damage += 2; g.purchasedUpgrades[2] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "+4 damage", description: "Tower gains +3 damage.", locked:false, cost:800, 
		func: function() {var g = global.selectedTower; if (global.coins < (800 * global.costModifier) || g.upgrades[2][1].locked) {exit}; global.coins -= 800 * global.costModifier; g.properties.damage += 3; g.purchasedUpgrades[2] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Pure lightning", description: "Lowers attack rate considerably, but now deals massive damage per attack.", locked:false, cost:1750, 
		func: function() {var g = global.selectedTower; if (global.coins < (1750 * global.costModifier) || g.upgrades[2][2].locked) {exit}; global.coins -= 1750 * global.costModifier; g.properties.fire_rate *= 4; g.properties.damage += 20; g.purchasedUpgrades[2] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Anti-frozen", description: "Tower can now damage frozen enemies.", locked:false, cost:150, 
		func: function() {var g = global.selectedTower; if (global.coins < (150 * global.costModifier) || g.upgrades[3][0].locked) {exit}; global.coins -= 150 * global.costModifier; ds_list_add(g.properties.damageTypes, "frozen"); g.purchasedUpgrades[3] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Shock", description: "(WIP) Tower now shocks and stuns enemies for a short time.", locked:false, cost:550, 
		func: function() {var g = global.selectedTower; if (global.coins < (550 * global.costModifier) || g.upgrades[3][1].locked) {exit}; global.coins -= 550 * global.costModifier; var tmp = "I NEED TO ADD THIS IN!"; g.purchasedUpgrades[3] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Chain", description: "(WIP) Causes attacks to chain to other nearby enemies", locked:false, cost:4000, 
		func: function() {var g = global.selectedTower; if (global.coins < (4000 * global.costModifier) || g.upgrades[3][2].locked) {exit}; global.coins -= 4000 * global.costModifier; var tmp = "I NEED TO ADD THIS IN!"; g.purchasedUpgrades[3] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true; g.updateUpgrades();}}]
];


projectile = oBullet;
sound = sndLightningTowerShoot;