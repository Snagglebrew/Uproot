function scr_changeHealth(_dmg){
	if(hp <= 0){
		instance_destroy();
		instance_create_layer(x,y,"Instances",deathAnim);
	} else {
		hp += _dmg
		hp = clamp(hp, 0, maxhp);
		if(_dmg < 0){
			immune = true;
			alarm[0] = immuneDur;
		}
	}
}