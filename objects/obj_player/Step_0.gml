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

//Pick up objects
if(keyboard_check_pressed(ord("X")) && emptyHands && (place_meeting(x,y,obj_pickup))){
	emptyHands = false;
	_pickup = instance_place(x,y,obj_pickup)
} else if (keyboard_check_pressed(ord("X")) and !emptyHands) emptyHands = true;
if (!emptyHands and (_pickup != undefined)) with(_pickup){
	x = other.x;
	y = other.y;
}
