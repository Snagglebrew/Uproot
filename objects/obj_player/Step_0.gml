/// @description
scr_movement();
hspd *= moveSpeed;
var grounded = place_meeting(x,y+1,obj_block);

//Vertical math
vspd += grav;
if _up && grounded vspd -= jumpHeight;

//Stay close to ground if sloped
if(grounded and !place_meeting(x, y + 4, obj_block) and vspd > 0) {
	while !place_meeting(x,y+1, obj_block) y+= 1;
}

//Move and collide
var _collideArr = move_and_collide(hspd, vspd, obj_block);
if(array_length(_collideArr) != 0 and place_meeting(x,y+vspd,obj_block)) vspd = 0; 