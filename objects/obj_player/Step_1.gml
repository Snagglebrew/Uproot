/// @description
scr_movement();
moveAdd = 0;
if (vspd != 0 || sprite_index == spr_playerJump){
	if vspd > 0 {
		sprite_index = spr_playerFall
		image_speed = 1
	}
	if vspd < 0{
		sprite_index = spr_playerJump
		image_speed = 1
	}
} else if(hdir != 0) { 
	image_speed = 1
	if(sprite_index != spr_playerWalk)
		sprite_index = spr_playerStartWalk
} else {
	image_speed = 1
	sprite_index = spr_playerIdle
}
if(hdir < 0 && image_xscale > 0 && vspd >= 0){
	image_xscale *= -1;
} else if (hdir > 0 && image_xscale < 0 && vspd >= 0){
	image_xscale *= -1;
}