// Inherit the parent event
event_inherited();

branches = []
with (obj_birdBranch)
{
	if (array_length(branches) == 0)
		branches[0] = x;
	else
	{
		if (branches[0] > x)
		{
			var temp = branches[0];
			branches[0] = x;
			branches[1] = temp;
		}
		else
			branches[1] = x;
	}
}

