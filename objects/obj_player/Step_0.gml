scr_movement();

// if there is rain, make sure we arent in it so we can time travel
var canTimeTravel = true;
if (layer_exists("Rain"))
{
	canTimeTravel = false;
	
	// check that we are fully encapsulated in a dry area, and if we are,
	// we can time travel
	var obj = instance_place(x, y, obj_blockRain);
	if (instance_exists(obj))
	{
		canTimeTravel = bbox_right - 1 <= obj.bbox_right &&
						bbox_left + 1 >= obj.bbox_left && 
						bbox_bottom - 1 <= obj.bbox_bottom && 
						bbox_top + 1 >= obj.bbox_top;
	}
}

//Time travel
if(keyboard_check_pressed(ord("Z")) && future && !place_meeting(x,y,obj_teleblock) && canTimeTravel){
	var _rm = room_get_name(room)
	_rm = string_delete(_rm, (string_length(_rm) - 5), 6)
	_rm = asset_get_index(_rm)
	room_goto(_rm)
}
if(keyboard_check_pressed(ord("Z")) && !future && !place_meeting(x,y,obj_teleblock) && canTimeTravel){
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
	hspd = (moveSpeed * hdir) + moveAdd;
else
{
	// else have some air "drag" (not really drag per se)
	hspd += airAcceleration * hdir;
	hspd = clamp(hspd, -wallJumpHorizontalSpeed, wallJumpHorizontalSpeed);
}

// move the player down (gravity)
if !grounded
	vspd += grav;

// when we jump
if (_up && grounded) { 
	vspd = -jumpHeight;

}
// if we wall jump
if (_up && slidingDownWall)
{
	// move the player up and away from the wall
	if(wallDir != sign(image_xscale))
		image_xscale *= -1
	vspd = -jumpHeight;
	hspd = wallDir * wallJumpHorizontalSpeed;
	
	// stop sliding down the wall
	slidingDownWall = false;
	wallSlideLerpPercent = 0;
	
	// enable air drag
	jumpingOffWall = true;
	alarm[1] = global.gameFPS * disableWallJumpAccelSeconds;
}

// stop sliding if player moves away from wall
if (slidingDownWall && !place_meeting(x - wallDir, y, obj_block))
{
	slidingDownWall = false;
	wallSlideLerpPercent = 0;
}

// move the player down the wall gradually
if (slidingDownWall && wallSlideLerpPercent <= 1)
{
	wallSlideLerpPercent += 1 / (global.gameFPS * wallSlideSecondsToLerp);
	
	vspd = lerp(0, wallSlideSpeed, wallSlideLerpPercent);
}

//Stay close to ground if sloped
if(grounded and !place_meeting(x, y + 4, obj_block) and vspd > 0) {
	while !place_meeting(x,y+1, obj_block) y+= 1;
}

//Pick up objects
if(keyboard_check_pressed(ord("X")) && emptyHands && (place_meeting(x,y,obj_pickup))){
	emptyHands = false;
	pickup = instance_place(x,y,obj_pickup)
} else if (keyboard_check_pressed(ord("X")) and !emptyHands){
	emptyHands = true;
	
	pickup.thrown = true;
	pickup = noone;
}
if(keyboard_check_pressed(ord("X")) && place_meeting(x,y,obj_goal)){
	obj_exit.goal = true;
}