// makani if you see this, do not continue
// if you continue, you did not see this

branches = []
var branch1 = collision_line(x, y-branchHeightOffset, x - 1000, y-branchHeightOffset, obj_birdBranch, false, false);
var branch2 = collision_line(x, y-branchHeightOffset, x + 1000, y-branchHeightOffset, obj_birdBranch, false, false);
show_debug_message(branch1);
show_debug_message(branch2);
if (branch1.x > branch2.x)
{
	branches[0] = branch2;
	branches[1] = branch1;
}
else
{
	branches[0] = branch1;
	branches[1] = branch2;
}

trigger = collision_line(x, y, x, y + 1000, obj_birdTrigger, false, false);

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
