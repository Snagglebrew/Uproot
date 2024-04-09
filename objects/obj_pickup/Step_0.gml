// check if this pickup is the one being carried by the player
if (instance_exists(obj_player))
{
	if (obj_player.pickup == self.id)
	{
		pickup = true;
		vspd = 0;
	}
	else 
		pickup = false;
} 
else 
	pickup = false
	
// if this isnt picked up, fall to the ground
if (!pickup)
{
	vspd += grav;
	
	var verticalCollideArray = move_and_collide(0, vspd, obj_floor);
	
	if(array_length(verticalCollideArray) != 0 and place_meeting(x,y+vspd,obj_floor)) 
	{
		vspd = 0;
	}
}