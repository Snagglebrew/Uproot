/// @description Insert description here
// You can write your code in this editor
var grounded = place_meeting(x,y+1,obj_block);
vspd += grav;
var horizontalCollideArray = move_and_collide(hspd, 0, obj_block);
var verticalCollideArray = move_and_collide(0, vspd, obj_block);
if(object_exists(obj_player)){
	if(obj_player.pickup == self.id){
		hspd = obj_player.hspd;
	} else {
		hspd += -sign(hspd) * 0.25;
	}
}
if(array_length(verticalCollideArray) != 0 and place_meeting(x,y+vspd,obj_block)) 
{
	vspd = 0;
}