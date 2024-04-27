if (obj_birdTrigger.startTrigger && !onCooldown)
{
	onCooldown = true;
	startingX = x;
	
	var pathRealSpeed = (currentBranch == 1) ? -pathSpeed : pathSpeed;
	path_start(path_bird, pathRealSpeed, path_action_stop, true);
	
	sprite_index = spr_bird2;
}
else if (x == path_get_x(path_bird, 1 - currentBranch))
{
	currentBranch = 1 - currentBranch;
	
	x = branches[currentBranch].x;
	y = branches[currentBranch].y + branchHeightOffset;
	
	onCooldown = false;
}

image_xscale = (currentBranch == 0) ? -0.5 : 0.5;

if (onCooldown)
{
	switch(currentBranch)
	{
		case 0:
			if (x >= startingX + distBetweenEnds * 5 / 8)
			{
				sprite_index = spr_bird1;
			}
			else if (x >= startingX + distBetweenEnds / 8)
			{
				sprite_index = spr_bird4;
			}
			
			image_angle = direction;
			
			break;
		case 1:
			if (x <= startingX - distBetweenEnds * 5 / 8)
			{
				sprite_index = spr_bird1;
			}
			else if (x <= startingX - distBetweenEnds / 8)
			{
				sprite_index = spr_bird4;
			}
			
			image_angle = 180 + direction;
			
			break;
	}
}
else
{
	image_angle = 0;
	
	sprite_index = spr_bird3;
}