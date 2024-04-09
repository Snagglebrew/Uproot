var grounded = place_meeting(x, y + 1, obj_block);

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

if (pickup)
{
	pickup.x = x;
	pickup.y = y;
}