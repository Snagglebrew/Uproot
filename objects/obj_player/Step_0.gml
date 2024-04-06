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

// if we are grounded, we arent jumping off a wall (duh)
var grounded = place_meeting(x,y+1,obj_block);
if (grounded)
	jumpingOffWall = false;

// if we arent jumping off a wall, move normally
if (!jumpingOffWall)
	hspd = moveSpeed * hdir;
else
{
	// else have some air "drag" (not really drag per se)
	hspd += airAcceleration * hdir;
	hspd = clamp(hspd, -wallJumpHorizontalSpeed, wallJumpHorizontalSpeed);
}

// move the player down (gravity)P
vspd += grav;

// when we jump
if (_up && grounded) 
	vspd = -jumpHeight;

// if we wall jump
if (_up && slidingDownWall)
{
	// move the player up and away from the wall
	vspd = -jumpHeight;
	hspd = wallDir * wallJumpHorizontalSpeed;
	
	// stop sliding down the wall
	slidingDownWall = false;
	wallSlideLerpPercent = 0;
	
	// enable air drag
	jumpingOffWall = true;
	alarm[1] = gameFPS * disableWallJumpAccelSeconds;
}

// move the player down the wall gradually
if (slidingDownWall && wallSlideLerpPercent <= 1)
{
	wallSlideLerpPercent += 1 / (gameFPS * wallSlideSecondsToLerp);
	
	vspd = lerp(0, wallSlideSpeed, wallSlideLerpPercent);
}

//Stay close to ground if sloped
if(grounded and !place_meeting(x, y + 4, obj_block) and vspd > 0) {
	while !place_meeting(x,y+1, obj_block) y+= 1;
}

// horizontal movement
// if we hit a wall and arent grounded, start sliding down the wall
var horizontalCollideArray = move_and_collide(hspd, 0, obj_block);
if (array_length(horizontalCollideArray) != 0)
{
	var collider = horizontalCollideArray[0];
	
	// find the direction of the wall
	if (x < collider.bbox_left)
		wallDir = -1;
	else
		wallDir = 1;
	
	slidingDownWall = !grounded || slidingDownWall;
}

// vertical movement
var verticalCollideArray = move_and_collide(0, vspd, obj_block);
if(array_length(verticalCollideArray) != 0 and place_meeting(x,y+vspd,obj_block)) 
{
	vspd = 0;
	slidingDownWall = false;
	wallSlideLerpPercent = 0;
}

//Pick up objects
if(keyboard_check_pressed(ord("X")) && emptyHands && (place_meeting(x,y,obj_pickup))){
	emptyHands = false;
	pickup = instance_place(x,y,obj_pickup)
} else if (keyboard_check_pressed(ord("X")) and !emptyHands) emptyHands = true;
if (!emptyHands and (pickup != undefined)) with(pickup){
	x = other.x;
	y = other.y;
}