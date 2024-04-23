// check if this pickup is the one being carried by the player
if (instance_exists(obj_player))
{
	if (obj_player.pickup == self.id)
	{
		pickup = true;
		vspd = 0;
		if(image_xscale > 0 && obj_player.image_xscale < 0){
			image_xscale *= -1;
		} else if (image_xscale < 0 && obj_player.image_xscale > 0){
			image_xscale *= -1;
		}
	}
	else 
		pickup = false;
} 
else 
	pickup = false
	
// if this isnt picked up, fall to the ground
if (!pickup)
{
	// when the player is moving while dropping the item, "throw" it
	if (thrown && instance_exists(obj_player))
	{
		hspd = obj_player.hspd * 2;
		thrown = false;
	}
	
	// slow down the object if it was thrown
	if (hspd != 0)
		hspd -= sign(hspd) * dragSpeed;
		
	vspd += grav;
	
	// move vertically (from gravity)
	var verticalCollideArray = move_and_collide(0, vspd, obj_floor);
	if(array_length(verticalCollideArray) != 0 and place_meeting(x,y+vspd,obj_floor)) 
	{
		vspd = 0;
	}
	
	// move horzontally (from throwing)
	move_and_collide(hspd, 0, obj_floor);
}
else
{
	hspd = 0;
	vspd = 0;
}