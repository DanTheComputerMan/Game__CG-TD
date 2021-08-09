if (properties.lifespan <= 0) { instance_destroy(); exit; }
properties.lifespan--;

if (!variable_instance_exists(self, "parentEnemy")) { parentEnemy = self; }

var rnd = function(num, test) {
	return (irandom(1) == 1 ? random(num) : -random(num));
}

// I need to fix this as it doesn't decrement pierce or damage enemies.
// Not a splash damage tower, so do the calculations for non-splash damage towers below:
if (!properties.splash) {
	enemy_collisions = ds_list_create(); // main projectile
	collision_circle_list(x, y, 15, oEnemy, false, true, enemy_collisions, true);
	for (var i = 0; i < ds_list_size(enemy_collisions); i++) {
		en = ds_list_find_value(enemy_collisions, i);
		
		var numMatchingTypes = 0;
		// Check the enemy's types/immunities. If the projectile does not have ALL then do 0 damage.
		for (var j = 0; j < ds_list_size(en.properties.types); j++) {
			var prop = ds_list_find_value(en.properties.types, j); // Get selected property.
			show_debug_message("<<<<<<<<<<<PROP>>>>>>>>>>>>>>:");
			show_debug_message(prop);
			show_debug_message("ds_list_find_index(parentTower.properties.damageTypes, prop):");
			show_debug_message(ds_list_find_index(parentTower.properties.damageTypes, prop));
			if (ds_list_find_index(parentTower.properties.damageTypes, prop) != -1) numMatchingTypes++;
		}
		
		show_debug_message("numMatchingTypes:");
		show_debug_message(numMatchingTypes);
		show_debug_message("ds_list_size(en.properties.types):");
		show_debug_message(ds_list_size(en.properties.types));
		
		// The projectile did not have all matching types, so kill the pojectile, exit, and do 0 damage.
		if ((ds_list_size(en.properties.types) != 0) && (numMatchingTypes != ds_list_size(en.properties.types))) {
			properties.pierce = 0;
			instance_destroy();
			exit;
		}
		
		//for (var j = 0; j < array_length(en.properties.types); j++) {
		//	for (var k = 0; k < array_length(parentTower.damageTypes); k++) {
		//		show_debug_message("en.properties.types[j]:");
		//		show_debug_message(en.properties.types[j]);
		//		show_debug_message("parentTower.damageTypes[k]:");
		//		show_debug_message(parentTower.damageTypes[k]);
		//		if (en.properties.types[j] == parentTower.damageTypes[k]) {
		//			numMatchingTypes++;
		//		}
		//	}
		//}
		
		//// The projectile did not have all matching types, so kill the pojectile, exit, and do 0 damage.
		//if ((array_length(en.properties.types) != 0) && array_length(en.properties.types) != numMatchingTypes) {
		//	properties.pierce = 0;
		//	instance_destroy();
		//	exit;
		//}
		
		switch (en.type) {
			case "camo":
				properties.damage += parentTower.properties.buffs.toCamoFixed;
				properties.damage *= parentTower.properties.buffs.toCamoMulti;
				break;
			case "black":
				properties.damage += parentTower.properties.buffs.toBlackFixed;
				properties.damage *= parentTower.properties.buffs.toBlackMulti;
				break;
			case "white":
				properties.damage += parentTower.properties.buffs.toWhiteFixed;
				properties.damage *= parentTower.properties.buffs.toBlackMulti;
				break;
			case "frozen":
				properties.damage += parentTower.properties.buffs.toFrozenFixed;
				properties.damage *= parentTower.properties.buffs.toFrozenMulti;
				break;
			case "lead":
				properties.damage += parentTower.properties.buffs.toLeadFixed;
				properties.damage *= parentTower.properties.buffs.toLeadMulti;
				break;
			case "ceramic":
				properties.damage += parentTower.properties.buffs.toCeramicFixed;
				properties.damage *= parentTower.properties.buffs.toCeramicMulti;
				break;
			case "boss":
				properties.damage += parentTower.properties.buffs.toBossFixed;
				properties.damage *= parentTower.properties.buffs.toBossMulti;
				break;
		}
		properties.damage = floor(properties.damage);
		
		// Quick and dirty band-aid fix b/c of the order game maker handles updating game objects.
		// W/o this, if an enemy spawned at the beginning of the track (path_position = 0), and a direct
		// target attack hit it (e.g. sniper), based on the update order, the enemy wouldn't exist in
		// this Step event.
		if (!variable_instance_exists(en, "parentEnemy")) exit;
		
		if (ds_list_find_index(enemies_hit, en.parentEnemy.id) == -1) { // Projectile hasn't hit this enemy yet.
			if (parentTower.properties.layers) en.layers = true;
			
			parentTower.properties.damageDealt += max(min(en.hp >= properties.damage ? properties.damage : en.hp - properties.damage, en.hp), 1);
			
			en.hp -= properties.damage;
			properties.pierce--;
			if (properties.pierce <= 0) { instance_destroy(); exit; }
		}
		ds_list_add(enemies_hit, en.parentEnemy.id);
	}
	exit;
}
enemy_collisions = ds_list_create(); // main projectile
enemy_collisions_subprojectile = ds_list_create(); // sub projectiles (ex: explosions from bombs/splash attacks).
if (properties.splash) collision_circle_list(x, y, properties.splashSize, oEnemy, false, true, enemy_collisions, true);

for (var i = 0; i < ds_list_size(enemy_collisions); i++) {
	var xx = x + rnd(properties.splashSize); var yy = y + rnd(properties.splashSize);
	//if (properties.splash && properties.tower == "explosion") show_debug_message(properties.pierce);
	var en = ds_list_find_value(enemy_collisions, i);
	
	
	var numMatchingTypes = 0;
	// Check the enemy's types/immunities. If the projectile does not have ALL then do 0 damage.
	for (var j = 0; j < ds_list_size(en.properties.types); j++) {
		var prop = ds_list_find_value(en.properties.types, j); // Get selected property.
		show_debug_message("<<<<<<<<<<<PROP>>>>>>>>>>>>>>:");
		show_debug_message(prop);
		show_debug_message("ds_list_find_index(parentTower.properties.damageTypes, prop):");
		show_debug_message(ds_list_find_index(parentTower.properties.damageTypes, prop));
		if (ds_list_find_index(parentTower.properties.damageTypes, prop) != -1) numMatchingTypes++;
	}
		
	show_debug_message("numMatchingTypes:");
	show_debug_message(numMatchingTypes);
	show_debug_message("ds_list_size(en.properties.types):");
	show_debug_message(ds_list_size(en.properties.types));
		
	// The projectile did not have all matching types, so kill the pojectile, exit, and do 0 damage.
	if ((ds_list_size(en.properties.types) != 0) && (numMatchingTypes != ds_list_size(en.properties.types))) {
		properties.pierce = 0;
		instance_destroy();
		exit;
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	if (properties.splash) {
		switch (properties.tower) { // type of splash tower.
			case "explosion": // sub-projectile.
				en.hp -= properties.damage;
				properties.pierce--;
				if (properties.pierce <= 0) { instance_destroy(); exit; }
				break;
			case "bomb":
				var sub_bomb = instance_create_depth(xx, yy, -2, oBomb__Blast); // create bomb explosion.
				sub_bomb.parentTower = parentTower;
				sub_bomb.properties = json_parse(json_stringify(properties)); // copy bomb properties to explosion.
				sub_bomb.properties.lifespan = 1;
				sub_bomb.properties.tower = "explosion";
				sub_bomb.image_xscale = properties.splashSize;
				sub_bomb.image_yscale = properties.splashSize;
				
				//properties.pierce = 0; // Set bomb's pierce to 0 as it just exploded.
				break;
			case "mortar": // Unmade yet.
				break;
		}
		
		collision_circle_list(xx, yy, properties.splashSize, oEnemy, false, true, enemy_collisions_subprojectile, false);
		
		if (properties.tower != "explosion") instance_destroy(); // Destroy splash projectile (if it's not a sub projectile).
		continue;
	}
	parentTower.properties.damageDealt += max(min(en.hp >= properties.damage ? properties.damage : en.hp - properties.damage, en.hp), 1);
	en.hp -= properties.damage;
	properties.pierce--;
	if (properties.pierce <= 0) { instance_destroy(); exit; }
}

// Loop through all enemies explosion sub projectile is in contact with.
for (var i = 0; i < ds_list_size(enemy_collisions_subprojectile); i++) {
	if (properties.pierce <= 0) { instance_destroy(); exit; }
	var en = ds_list_find_value(enemy_collisions_subprojectile, i);
	en.hp -= properties.damage;
	
	parentTower.properties.damageDealt += max(min(en.hp >= properties.damage ? properties.damage : en.hp - properties.damage, en.hp), 1);
	properties.pierce--;
}