/// @description
if place_meeting(x,y - sprite_height/8	, obj_player) {
	obj_player.moveAdd += pathSpeed;
}
if place_meeting(x-pathSpeed, y, obj_player){
	path_speed = 0
} else if place_meeting(x+pathSpeed, y, obj_player){
	path_speed = 0
} else { path_speed = pathSpeed; }

if (blockRainObject != noone)
{
	blockRainObject.x = x - sprite_width / 2;
}