/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player){
	if obj_player.pickup == self.id{ 
		pickup = true
	} else {pickup = false}
} else {pickup = false}

var horizontalCollideArray = move_and_collide(hspd, 0, obj_floor);
var verticalCollideArray = move_and_collide(0, vspd, obj_floor);
if(pickup){
	temphspd = obj_player.hspd * 2;
} else if(temphspd != 0 and !pickup){
	hspd = temphspd;
	temphspd = 0;
}
if !pickup {
	vspd += grav;
}
hspd += -sign(hspd) * 0.25;
if(array_length(verticalCollideArray) != 0 and place_meeting(x,y+vspd,obj_floor)) 
{
	vspd = 0;
}