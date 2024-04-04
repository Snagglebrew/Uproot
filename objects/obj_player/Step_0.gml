scr_movement();

//Time travel
if(keyboard_check_pressed(ord("Z")) && future){
	travel = true
	prevX = x
	prevY = y
	prevHspd = hspd
	prevVspd = vspd
	var _rm = room_get_name(room)
	_rm = string_delete(_rm, (string_length(_rm) - 5), 6)
	_rm = asset_get_index(_rm)
	room_goto(_rm)
}
if(keyboard_check_pressed(ord("Z")) && !future){
	travel = true
	prevX = x
	prevY = y
	prevHspd = hspd
	prevVspd = vspd
	var _rm = room_get_name(room)
	_rm = _rm + "Future"
	_rm = asset_get_index(_rm)
	room_goto(_rm)
}

//Movement
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
	pickup = instance_place(x,y,obj_pickup)
} else if (keyboard_check_pressed(ord("X")) and !emptyHands) emptyHands = true;
if (!emptyHands and (pickup != undefined)) with(pickup){
	x = other.x;
	y = other.y;
}