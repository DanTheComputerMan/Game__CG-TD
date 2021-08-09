/// @description oTowerParent Firing Alarm.

// This is in case the enemy is in rage at first, but
// by the time we go to shoot at it, it's out of range.

if (objectToShoot && instance_exists(objectToShoot)) {
	var xx = x; var yy = y;
	if (directTarget) { xx = objectToShoot.x; yy = objectToShoot.y; };
	
	var sDist = projectilesInfo.spreadDistance;
	
	for (var i = 0; i < projectilesInfo.amount; i++) { // To allow for towers that shoot multiple projectiles.
		if (projectilesInfo.spreadAngle > 0) { // multiple projectiles, and in a spread pattern.
			
		} else if (projectilesInfo.spreadDistance > 0) { // multiple parallel projectiles.
			xx = xx + sDist;
			yy = yy + sDist;
			sDist = (-sDist) + sign(-sDist); // 2, -3, 4, -5, 6, -7, 8, -9, 10
		}
		
		
		// Temp var bullet = id of oBullet object created.
		var p = instance_create_depth(xx,yy,-1,projectile);
		
		p.parentTower = self;
		//p.parentTower = id;
		
		p.properties = json_parse(json_stringify(properties));
		p.properties.lifespan = 1000;
		
		if (directTarget) continue;
		p.speed = properties.projectile_speed;
		
		// 0 to 360, going counter-clockwise.
		p.direction = point_direction(x,y,objectToShoot.x,objectToShoot.y);
		
	}
	
	audio_play_sound(sound, 1, false);
	alarm[0] = properties.fire_rate;
} else {
	shooting = false;
}