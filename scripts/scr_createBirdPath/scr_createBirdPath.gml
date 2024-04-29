function createBirdPath(leftBranch, distBetweenEnds, branchHeightOffset, maxDipHeight)
{
	var birdPath = path_add();
	path_set_closed(birdPath, false);
	path_set_kind(birdPath, 1);
	
	path_add_point(birdPath, leftBranch.x, leftBranch.y + branchHeightOffset, 100);
	path_add_point(birdPath, leftBranch.x + distBetweenEnds / 4, leftBranch.y + branchHeightOffset + maxDipHeight - 50, 100);
	path_add_point(birdPath, leftBranch.x + distBetweenEnds / 2, leftBranch.y + branchHeightOffset + maxDipHeight, 100);
	path_add_point(birdPath, leftBranch.x + distBetweenEnds * 3 / 4, leftBranch.y + branchHeightOffset + maxDipHeight - 50, 100);
	path_add_point(birdPath, leftBranch.x + distBetweenEnds, leftBranch.y + branchHeightOffset, 100);
	
	return birdPath;
}