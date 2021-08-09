properties = {};
properties.cost = 125 * global.costModifier;

event_inherited();

properties.tower = "sniper";
properties.range = 300;
properties.damage = 2; // Originally 20
properties.pierce = 1;
properties.fire_rate = room_speed / 0.7; // Originally room_speed / 0.4
properties.orig_fire_rate = room_speed / 0.7;
properties.projectile_speed = 60;

//array_push(damageTypes, "impact");
ds_list_add(properties.damageTypes, "black");
ds_list_add(properties.damageTypes, "white");
ds_list_add(properties.damageTypes, "ice");
ds_list_add(properties.damageTypes, "lead");
ds_list_add(properties.damageTypes, "grounded");
ds_list_add(properties.damageTypes, "baked");
ds_list_add(properties.damageTypes, "glass");
ds_list_add(properties.damageTypes, "warded");
ds_list_add(properties.damageTypes, "solvent");
ds_list_add(properties.damageTypes, "shield");
ds_list_add(properties.damageTypes, "shield_black");
ds_list_add(properties.damageTypes, "shield_white");
ds_list_add(properties.damageTypes, "shield_lead");
ds_list_add(properties.damageTypes, "shield_ice");
ds_list_add(properties.damageTypes, "shield_grounded");
ds_list_add(properties.damageTypes, "shield_baked");
ds_list_add(properties.damageTypes, "shield_glass");
ds_list_add(properties.damageTypes, "shield_warded");
ds_list_add(properties.damageTypes, "shield_solvent");

upgrades = [
	[{thumbnail: -1, text: "+2 damage", description: "Tower deals 4 damage.", locked:false, cost:150, 
		func: function() {var g = global.selectedTower; if (global.coins < (150 * global.costModifier) || g.upgrades[0][0].locked) {exit}; global.coins -= 150 * global.costModifier; g.properties.damage += 2; g.purchasedUpgrades[0] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "+3 damage.", description: "Tower now deals 7 damage.", locked:false, cost:1250, 
		func: function() {var g = global.selectedTower; if (global.coins < (1250 * global.costModifier) || g.upgrades[0][1].locked) {exit}; global.coins -= 1250 * global.costModifier; g.properties.damage += 3; g.purchasedUpgrades[0] = 2 g.updateUpgrades();;}}, 
	{thumbnail: -1, text: "+22 damage", description: "Tower now deals 27 damage (can destroy a rainbow in 1 hit).", locked:false, cost:4000, 
		func: function() {var g = global.selectedTower; if (global.coins < (4000 * global.costModifier) || g.upgrades[0][2].locked) {exit}; global.coins -= 4000 * global.costModifier; g.properties.damage += 22; g.purchasedUpgrades[0] = 3; g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Quick shots", description: "Tower attacks 33% faster.", locked:false, cost:225, 
		func: function() {var g = global.selectedTower; if (global.coins < (225 * global.costModifier) || g.upgrades[1][0].locked) {exit}; global.coins -= 225 * global.costModifier; g.properties.fire_rate *= (1/1.33); g.purchasedUpgrades[1] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Rapid shots", description: "Tower attacks 75% faster.", locked:false, cost:250, 
		func: function() {var g = global.selectedTower; if (global.coins < (250 * global.costModifier) || g.upgrades[1][1].locked) {exit}; global.coins -= 250 * global.costModifier; g.properties.fire_rate *= (1/1.75); g.purchasedUpgrades[1] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Fast shots.", description: "Tower attacks 250% faster.", locked:false, cost:8400, 
		func: function() {var g = global.selectedTower; if (global.coins < (8400 * global.costModifier) || g.upgrades[1][2].locked) {exit}; global.coins -= 8400 * global.costModifier; g.properties.fire_rate *= (1/3.5); g.purchasedUpgrades[1] = 3; g.upgrades[0][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Anti-lead", description: "Tower can now damage lead enemies.", locked:false, cost:80, 
		func: function() {var g = global.selectedTower; if (global.coins < (80 * global.costModifier) || g.upgrades[2][0].locked) {exit}; global.coins -= 80 * global.costModifier; ds_list_add(g.properties.damageTypes, "lead"); g.purchasedUpgrades[2] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Anti-camo", description: "Tower can now see and damage camo enemies.", locked:false, cost:225, 
		func: function() {var g = global.selectedTower; if (global.coins < (225 * global.costModifier) || g.upgrades[2][1].locked) {exit}; global.coins -= 225 * global.costModifier; ds_list_add(g.properties.damageTypes, "camo"); g.purchasedUpgrades[2] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Ricochet", description: "(WIP) Attacks have a 50% chance to affect another enemy.", locked:false, cost:1500, 
		func: function() {var g = global.selectedTower; if (global.coins < (1500 * global.costModifier) || g.upgrades[2][2].locked) {exit}; global.coins -= 1500 * global.costModifier; var tmp = "I NEED TO ADD THIS IN!"; g.purchasedUpgrades[2] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Anti-ceramic", description: "Deals 1.5x damage to ceramic enemies.", locked:false, cost:125, 
		func: function() {var g = global.selectedTower; if (global.coins < (125 * global.costModifier) || g.upgrades[3][0].locked) {exit}; global.coins -= 125 * global.costModifier; g.properties.buffs.toCeramicMulti += 0.5; g.purchasedUpgrades[3] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Anti-boss", description: "Deals 3x damage to boss enemies.", locked:false, cost:950, 
		func: function() {var g = global.selectedTower; if (global.coins < (950 * global.costModifier) || g.upgrades[3][1].locked) {exit}; global.coins -= 950 * global.costModifier; g.properties.buffs.toBossMulti += 2; g.purchasedUpgrades[3] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Stun", description: "(WIP) Tower stuns enemies hit for 2 seconds.", locked:false, cost:5000, 
		func: function() {var g = global.selectedTower; if (global.coins < (5000 * global.costModifier) || g.upgrades[3][2].locked) {exit}; global.coins -= 5000 * global.costModifier; var tmp = "I NEED TO ADD THIS IN!"; g.purchasedUpgrades[3] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true; g.updateUpgrades();}}]
];


//layers = 2; // sort this out later.
properties.layers = true;

directTarget = true;

projectile = oBullet;
sound = sndSniperTowerShoot;