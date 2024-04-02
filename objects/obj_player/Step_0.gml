/// @description
scr_movement();
hspd *= moveSpeed;
move_and_collide(hspd, vspd, obj_block);
var grounded = place_meeting(x,y+1,obj_block);
vspd += grav;
if(grounded){
	vspd = 0;
}
if(_up && grounded){
	vspd -= jumpHeight;
}