draw_self();

// Tower is selected, or user's mouse is hovering over tower, so highlight it.
if (global.selectedTower == self || mouseOver(x,y,sprite_width,sprite_height)) {
	shader_set(shaderTowerOutline);
	var texture = sprite_get_texture(sprite_index, image_index);
	var texture_width = texture_get_texel_width(texture);
	var texture_height = texture_get_texel_height(texture);
	
	// put stuff in -> vec2 2 values.
	shader_set_uniform_f(uniForm_Handle, texture_width, texture_height);
	
	draw_self();
	shader_reset();
}

//if(global.selectedTower == self or mouseOver(x,y,sprite_width,sprite_height)) { // tower is selected.
if(global.selectedTower == self) { // tower is selected.
	// Draw range circle.
	draw_set_color(c_white);
	draw_circle(x,y,properties.range,true);
	
	// Draw Upgrades Menu.
	draw_set_color(merge_color(c_orange, c_gray, 0.2));
		
	//draw_rectangle(544,64,639,140,false);
	draw_rectangle(544,64,639,447,false); // Top. Contains damage and targeting.
	draw_set_color(c_gray);
	draw_rectangle(544,140,639,447,false); // Bottom. Behind upgrade buttons.
	var d = string(properties.damageDealt);
	
	// adds commas to number;
	for (var i = string_length(d) - 3; i > 0; i -= 3) {
		d = string_insert(",", d, i+1);
	}
	
	//draw_text(560,70,"Damage:");
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_middle);
	//draw_text(590,100,d);
	draw_text(560,70,"Damage:");
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(590,100,d);
	draw_text(590,130,targetingChoice);
	
	draw_set_color(c_white);
}


// This also determines an enemy exists at all. Dual purpose.
// temp variable to find nearest enemy. 'Close' targeting.
//var en = instance_nearest(x,y,oEnemy);

// test for 'first' targeting instead of close. This 
// actually just selects enemy closest to the beginning
// of the path, not the end of the path. This is almost
// enough for 'last' targeting.
// var iii = path_get_number(path0);
// var en = instance_nearest(path_get_point_x(path0,iii), path_get_point_y(path0,iii), oEnemy);
// show_debug_message(self);
//if (en != noone) {
var en = noone;
switch (targetingChoice) {
	case "First":
		objectToShoot = 0;
		for (var i = 0; i < instance_number(oEnemy); i++) {
			var enemy = instance_find(oEnemy, i);
			if (!instance_exists(enemy)) continue; // Safeguard.
			var enemyDistance = point_distance(x, y, enemy.x, enemy.y);
			if (enemyDistance <= properties.range) {
				if (objectToShoot == 0) objectToShoot = enemy;
				var pos = enemy.path_position;
				if (pos > objectToShoot.path_position) objectToShoot = enemy;
			}
			if (objectToShoot > 0) { // if an enemy has been found.
				if (mouseOver(x,y,sprite_width,sprite_height)) {
					// Draw line to enemy to prove targeting.
					// Take out of final version.
					draw_line(x,y,objectToShoot.x,objectToShoot.y);
				}
			}
		}
		if (objectToShoot != 0) {
			if (!shooting) {
				alarm[0] = 1;
				shooting = true;
			}
		}
		break;
	case "Last":
		objectToShoot = 0;
		for (var i = 0; i < instance_number(oEnemy); i++) {
			var enemy = instance_find(oEnemy, i);
			if (!instance_exists(enemy)) continue; // Safeguard.
			var enemyDistance = point_distance(x, y, enemy.x, enemy.y);
			if (enemyDistance <= properties.range) {
				if (objectToShoot == 0) objectToShoot = enemy;
				var pos = enemy.path_position;
				if (pos < objectToShoot.path_position) objectToShoot = enemy;
			}
			if (objectToShoot > 0) { // if an enemy has been found.
				if (mouseOver(x,y,sprite_width,sprite_height)) {
					// Draw line to enemy to prove targeting.
					// Take out of final version.
					draw_line(x,y,objectToShoot.x,objectToShoot.y);
				}
			}
		}
		if (objectToShoot != 0) {
			if (!shooting) {
				alarm[0] = 1;
				shooting = true;
			}
		}
		break;
	case "Close":
		en = instance_nearest(x,y,oEnemy);
		if (!instance_exists(en)) break; // Safeguard.
		// range + 10 covers the whole enemy, not just the middle pixel.
		if (point_distance(x,y,en.x,en.y) <= properties.range+15) { // point_distance is length from tower to enemy.
			if (!shooting) {
				alarm[0] = 1;
				shooting = true;
			}
		
			objectToShoot = en;
			// When this rotate's the tower's sprite, it can make it hard to place towers next to it.
			//var pd = point_direction(x,y,en.x,en.y);
			//var dd = angle_difference(image_angle, pd);
			//image_angle -= min(abs(dd), 10) * sign(dd);
			if (mouseOver(x,y,sprite_width,sprite_height)) {
				// Draw line to enemy to prove targeting.
				// Take out of final version.
				draw_line(x,y,en.x,en.y);
			}
		} else {
			shooting = false;
			objectToShoot = noone;
		}
		break;
	case "Far": // Currently does not work for whatever reason. All other ones work.
		en = instance_nearest(x,y,oEnemy); // instance_furthest doesn't work, and we need to start off with an enemy.
		if (!instance_exists(en)) break; // Safeguard.
		
		objectToShoot = 0;
		for (var i = 0; i < instance_number(oEnemy); i++) {
			var enemy = instance_find(oEnemy, i);
			if (!instance_exists(enemy)) continue; // Safeguard.
			var enemyDistance = point_distance(x, y, enemy.x, enemy.y);
			if (enemyDistance <= properties.range) {
				if (objectToShoot == 0) objectToShoot = enemy;
				//var pos = enemy.path_position;
				if (enemyDistance > point_distance(x, y, objectToShoot.x, objectToShoot.y)) objectToShoot = enemy;
			}
			if (objectToShoot > 0) { // if an enemy has been found.
				if (mouseOver(x,y,sprite_width,sprite_height)) {
					// Draw line to enemy to prove targeting.
					// Take out of final version.
					draw_line(x,y,objectToShoot.x,objectToShoot.y);
				}
			}
		}
		if (objectToShoot != 0) {
			if (!shooting) {
				alarm[0] = 1;
				shooting = true;
			}
		}
		break;
	case "Strong":
		objectToShoot = 0;
		for (var i = 0; i < instance_number(oEnemy); i++) {
			var enemy = instance_find(oEnemy, i);
			if (!instance_exists(enemy)) continue; // Safeguard.
			var enemyDistance = point_distance(x, y, enemy.x, enemy.y);
			if (enemyDistance <= properties.range) {
				if (objectToShoot == 0) objectToShoot = enemy;
				if (enemy.tier > objectToShoot.tier) objectToShoot = enemy;
			}
			if (objectToShoot > 0) { // if an enemy has been found.
				if (mouseOver(x,y,sprite_width,sprite_height)) {
					// Draw line to enemy to prove targeting.
					// Take out of final version.
					draw_line(x,y,objectToShoot.x,objectToShoot.y);
				}
			}
		}
		if (objectToShoot != 0) {
			if (!shooting) {
				alarm[0] = 1;
				shooting = true;
			}
		}
		break;
	case "Weak":
		objectToShoot = 0;
		for (var i = 0; i < instance_number(oEnemy); i++) {
			var enemy = instance_find(oEnemy, i);
			if (!instance_exists(enemy)) continue; // Safeguard.
			var enemyDistance = point_distance(x, y, enemy.x, enemy.y);
			if (enemyDistance <= properties.range) {
				if (objectToShoot == 0) objectToShoot = enemy;
				if (enemy.tier < objectToShoot.tier) objectToShoot = enemy;
			}
			if (objectToShoot > 0) { // if an enemy has been found.
				if (mouseOver(x,y,sprite_width,sprite_height)) {
					// Draw line to enemy to prove targeting.
					// Take out of final version.
					draw_line(x,y,objectToShoot.x,objectToShoot.y);
				}
			}
		}
		if (objectToShoot != 0) {
			if (!shooting) {
				alarm[0] = 1;
				shooting = true;
			}
		}
		break;
}