// Shader information so we can draw an outline around the tower when it's selected later on.
//upixelH = shader_get_uniform(shaderTowerOutline, "pixelH");
//upixelW = shader_get_uniform(shaderTowerOutline, "pixelW");
//// Gets id of the texture and gets size of it.
//texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
//texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

uniForm_Handle = shader_get_uniform(shaderTowerOutline, "texture_Pixel");

btns = [];

updateUpgrades = function () {
	for (var i = 0; i < 4; i++) {
		if (purchasedUpgrades[i] >= array_length(upgrades[i])) {
			btns[i].image = sUpgradeTowerDisabled; // Max upgrade tier reached.
			btns[i].text = "Maxed"; // No upgrade to purchase, so 0;
			btns[i].colors.text = c_black;
			btns[i].cost = 0; // No upgrade to purchase, so 0;
			btns[i].description = "Maxed";
			btns[i].func = function() {}; // Don't allow any more upgrades.
			continue;
		}
		var upgrade = upgrades[i][purchasedUpgrades[i]]; // Get current upgrade of this tier.
		btns[i].thumbnail = upgrade.thumbnail;
		btns[i].text = upgrade.text;
		btns[i].cost = floor(upgrade.cost * global.costModifier);
		btns[i].description = upgrade.description;
		btns[i].func = upgrade.func;
		if (upgrade.locked) {
			btns[i].image = sUpgradeTowerLocked;
		} else if (global.coins < (upgrade.cost * global.costModifier)) {
			btns[i].image = sUpgradeTowerDisabled;
		} else {
			btns[i].image = sUpgradeTowerEnabled;
		}
	}
}

properties = {
	cost: properties.cost,
	damageDealt: 0,
	range: 1,
	orig_range: 1,
	fire_rate: room_speed,
	orig_fire_rate: room_speed,
	damage: 1,
	pierce: 1,
	layers: false,
	projectile_speed: 1,
	directTarget: false,
	
	//damageTypes: [],
	damageTypes: ds_list_create(),
	buffs: {
		toFrozenFixed: 1,
		toFrozenMulti: 1,
		toLeadFixed: 1,
		toLeadMulti: 1,
		toCamoFixed: 1,
		toCamoMulti: 1,
		toBlackFixed: 1,
		toBlackMulti: 1,
		toWhiteFixed: 1,
		toWhiteMulti: 1,
		toCeramicFixed: 1,
		toCeramicMulti: 1,
		toBossFixed: 1,
		toBossMulti: 1,
	},
	splash: false,
	splashSize: 0,
	knockback: false,
	knockbackAmount: 0
}

range = 1;
orig_range = range;
fire_rate = room_speed;
orig_fire_rate = fire_rate;
damage = 1;
pierce = 1;
projectile_speed = 1;

projectiles = [];
projectilesInfo = { amount: 1, spreadAngle: 0, spreadDistance: 0 }; // Stores info about projectile spread.
/*
	{
		amount: 3,
		spreadAngle: 0.3, // If spread angle is 0, then the next one determines distance apart they are since they're parallel.
		spreadDistance: 5
	}
*/

directTarget = false; // e.g. sniper, mortar, etc.

upgrades = [
	[{thumbnail: -1, text: "", description: "", locked:false, cost:0, func: function() {}}],
	[{thumbnail: -1, text: "", description: "", locked:false, cost:0, func: function() {}}],
	[{thumbnail: -1, text: "", description: "", locked:false, cost:0, func: function() {}}],
	[{thumbnail: -1, text: "", description: "", locked:false, cost:0, func: function() {}}]
];
purchasedUpgrades = [
	0,
	0,
	0,
	0
]

targetingChoice = "First";
targetingChoicesLeft = {
	First: "Weak",
	Last: "First",
	Close: "Last",
	Far: "Close",
	Strong: "Far",
	Weak: "Strong"
}
targetingChoicesRight = {
	First: "Last",
	Last: "Close",
	Close: "Far",
	Far: "Strong",
	Strong: "Weak",
	Weak: "First"
}

shooting = false;
objectToShoot = noone;

global.coins -= properties.cost;