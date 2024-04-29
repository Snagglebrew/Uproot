// makani if you see this, do not continue
// if you continue, you did not see this
image_xscale = abs(image_xscale);

branches = [leftBranch, rightBranch]

currentBranch = int64(startOnRightBranch);

distBetweenEnds = branches[1].x - branches[0].x;
maxDipHeight = trigger.y - (branches[0].y + branchHeightOffset);
birdPath = createBirdPath(branches[0], distBetweenEnds, branchHeightOffset, maxDipHeight);

startingX = -1;
onCooldown = false;
changeDirectionToPath = false;

startingScaleX = image_xscale;
sprite_index = spr_birdIdle;
x = branches[currentBranch].x;
y = branches[currentBranch].y + branchHeightOffset;