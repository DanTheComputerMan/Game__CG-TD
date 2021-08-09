properties = {};
properties.cost = 3000 * global.costModifier;

event_inherited();

properties.tower = "super";
properties.range = 200;
properties.orig_range = 200;
properties.damage = 1;
properties.pierce = 1;
properties.fire_rate = room_speed / 10;
//fire_rate = room_speed / 60;
properties.projectile_speed = 12;

//array_push(damageTypes, "sharp");
ds_list_add(properties.damageTypes, "black");
ds_list_add(properties.damageTypes, "white");
ds_list_add(properties.damageTypes, "grounded");
ds_list_add(properties.damageTypes, "baked");
ds_list_add(properties.damageTypes, "glass");
ds_list_add(properties.damageTypes, "warded");
ds_list_add(properties.damageTypes, "solvent");
ds_list_add(properties.damageTypes, "shield");
ds_list_add(properties.damageTypes, "shield_black");
ds_list_add(properties.damageTypes, "shield_white");
ds_list_add(properties.damageTypes, "shield_grounded");
ds_list_add(properties.damageTypes, "shield_baked");
ds_list_add(properties.damageTypes, "shield_glass");
ds_list_add(properties.damageTypes, "shield_warded");
ds_list_add(properties.damageTypes, "shield_solvent");

upgrades = [
	[{thumbnail: -1, text: "+2 Damage", description: "Tower gains +2 damage.", locked:false, cost:1800, 
		func: function() {var g = global.selectedTower; if (global.coins < (1800 * global.costModifier) || g.upgrades[0][0].locked) {exit}; global.coins -= 1800 * global.costModifier; g.properties.damage += 2; g.purchasedUpgrades[0] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "+1 Pierce", description: "Tower gains +1 pierce.", locked:false, cost:7500, 
		func: function() {var g = global.selectedTower; if (global.coins < (7500 * global.costModifier) || g.upgrades[0][1].locked) {exit}; global.coins -= 7500 * global.costModifier; g.properties.pierce += 1; g.purchasedUpgrades[0] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Layered shots", description: "Tower now deals layer damage.", locked:false, cost:15000, 
		func: function() {var g = global.selectedTower; if (global.coins < (15000 * global.costModifier) || g.upgrades[0][2].locked) {exit}; global.coins -= 15000 * global.costModifier; g.properties.layers = true; g.purchasedUpgrades[0] = 3; g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "More range", description: "Tower gains +15% range.", locked:false, cost:1000, 
		func: function() {var g = global.selectedTower; if (global.coins < (1000 * global.costModifier) || g.upgrades[1][0].locked) {exit}; global.coins -= 1000 * global.costModifier; g.properties.range *= 1.15; g.purchasedUpgrades[1] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Big range", description: "Tower gains +20% range.", locked:false, cost:1500, 
		func: function() {var g = global.selectedTower; if (global.coins < (1500 * global.costModifier) || g.upgrades[1][1].locked) {exit}; global.coins -= 1500 * global.costModifier; g.properties.range *= 1.2; g.purchasedUpgrades[1] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Global range", description: "Tower gains full-map range, and now has seeking (WIP) shots.", locked:false, cost:8000, 
		func: function() {var g = global.selectedTower; if (global.coins < (8000 * global.costModifier) || g.upgrades[1][2].locked) {exit}; global.coins -= 8000 * global.costModifier; g.properties.range *= 3.5; var tmp = "I NEED TO ADD SEEKING SHOTS IN!"; g.purchasedUpgrades[1] = 3; g.upgrades[0][2].locked = true;g.upgrades[2][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Crit Shots", description: "(WIP) Attacks have a 25% chance of crit, causing double damage.", locked:false, cost:750, 
		func: function() {var g = global.selectedTower; if (global.coins < (750 * global.costModifier) || g.upgrades[2][0].locked) {exit}; global.coins -= 750 * global.costModifier; g.properties.crit = true; g.properties.crit_chance = 0.25; g.purchasedUpgrades[2] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Stunning", description: "(WIP) Attacks have a 20% chance of stunning enemies hit for 0.5 seconds.", locked:false, cost:4500, 
		func: function() {var g = global.selectedTower; if (global.coins < (4500 * global.costModifier) || g.upgrades[2][1].locked) {exit}; global.coins -= 4500 * global.costModifier; g.properties.stun = true; g.properties.stun_amount = 2; g.purchasedUpgrades[2] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Double", description: "Throws 2 darts instead of 1.", locked:false, cost:9000, 
		func: function() {var g = global.selectedTower; if (global.coins < (9000 * global.costModifier) || g.upgrades[2][2].locked) {exit}; global.coins -= 9000 * global.costModifier; g.projectilesInfo.amount += 1; g.projectilesInfo.spreadDistance += 15; g.purchasedUpgrades[2] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[3][2].locked = true; g.updateUpgrades();}}],
	
	[{thumbnail: -1, text: "Anti-lead", description: "Tower can now damage lead enemies.", locked:false, cost:450, 
		func: function() {var g = global.selectedTower; if (global.coins < (450 * global.costModifier) || g.upgrades[3][0].locked) {exit}; global.coins -= 450 * global.costModifier; ds_list_add(g.properties.damageTypes, "lead"); g.purchasedUpgrades[3] = 1; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Anti-camo", description: "Tower can now see and damage camo enemies.", locked:false, cost:2200, 
		func: function() {var g = global.selectedTower; if (global.coins < (2200 * global.costModifier) || g.upgrades[3][1].locked) {exit}; global.coins -= 2200 * global.costModifier; ds_list_add(g.properties.damageTypes, "camo"); g.purchasedUpgrades[3] = 2; g.updateUpgrades();}}, 
	{thumbnail: -1, text: "Knockback", description: "Tower knocks back enemies when attacking.", locked:false, cost:12000, 
		func: function() {var g = global.selectedTower; if (global.coins < (12000 * global.costModifier) || g.upgrades[3][2].locked) {exit}; global.coins -= 12000 * global.costModifier; g.properties.knockback = true; g.properties.knockbackAmount = 0.004; g.purchasedUpgrades[3] = 3; g.upgrades[0][2].locked = true;g.upgrades[1][2].locked = true;g.upgrades[2][2].locked = true; g.updateUpgrades();}}]
];

projectile = oBullet;
sound = sndDartTowerShoot;