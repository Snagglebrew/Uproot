if (trigger.startTrigger && !onCooldown)
{
	onCooldown = true;
	startingX = x;
	
	var pathRealSpeed = (currentBranch == 1) ? -pathSpeed : pathSpeed;
	path_start(birdPath, pathRealSpeed, path_action_stop, true);
	
	sprite_index = spr_birdStart;
	image_index = 0;
}
else if (x == path_get_x(birdPath, 1 - currentBranch))
{
	currentBranch = 1 - currentBranch;
	
	x = branches[currentBranch].x;
	y = branches[currentBranch].y + branchHeightOffset;
	
	onCooldown = false;
	
	changeDirectionToPath = false;
	
	sprite_index = spr_birdIdle;
	image_index = 0;
	image_speed = 1;
}

image_xscale = (currentBranch == 0) ? -startingScaleX : startingScaleX;

if (onCooldown)
{
	switch(sprite_index)
	{
		case spr_birdStart:
			if (image_index == 2)
			{
				sprite_index = spr_birdDive;
				image_index = 0;
			}
		
			break;
		case spr_birdDive:
			if (image_index == 4)
				changeDirectionToPath = true;
			else if (image_index == 5)
			{
				var closeEnough = (currentBranch == 0) ? 
									x >= startingX + distBetweenEnds * 7 / 8 : 
									x <= startingX - distBetweenEnds * 7 / 8;
				
				if (closeEnough)
				{
					sprite_index = spr_birdAscend;
					image_speed = 1;
					image_index = 0;
				}
				else
					image_speed = 0;
			}
		
			break;
		case spr_birdAscend:
			if (image_index == 1)
				changeDirectionToPath = false;
			else if (image_index == 5)
				image_speed = 0;
		
			break;
	}
}

if (changeDirectionToPath)
{
	switch(currentBranch)
	{
		case 0:
			image_angle = direction;
			
			break;
		case 1:
			image_angle = 180 + direction;
			
			break;
	}
}
else
	image_angle = 0;