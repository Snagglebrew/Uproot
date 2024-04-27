// makani if you see this, do not continue
// if you continue, you did not see this

branches = []
for (var i = 0; i < 2; i++)
{
	var obj = instance_find(obj_birdBranch, i);
	
	if (array_length(branches) == 0)
		branches[0] = obj.id;
	else
	{
		if (branches[0].x > obj.x)
		{
			var temp = branches[0];
			branches[0] = obj.id;
			branches[1] = temp;
		}
		else
			branches[1] = obj.id;
	}
}

currentBranch = irandom(1);

x = branches[currentBranch].x;
y = branches[currentBranch].y + branchHeightOffset;

distBetweenEnds = branches[1].x - branches[0].x;

path_add_point(path_bird, branches[0].x, branches[0].y + branchHeightOffset, 100);
path_add_point(path_bird, branches[0].x + distBetweenEnds / 4, branches[0].y + branchHeightOffset + maxDipHeight - 50, 100);
path_add_point(path_bird, branches[0].x + distBetweenEnds / 2, branches[0].y + branchHeightOffset + maxDipHeight, 100);
path_add_point(path_bird, branches[0].x + distBetweenEnds * 3 / 4, branches[0].y + branchHeightOffset + maxDipHeight - 50, 100);
path_add_point(path_bird, branches[0].x + distBetweenEnds, branches[0].y + branchHeightOffset, 100);

onCooldown = false;
startingX = -1;

startingScaleX = image_xscale;

sprite_index = spr_birdIdle;

changeDirectionToPath = false;