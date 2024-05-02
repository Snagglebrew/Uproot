var trees = getScrollingTrees(obj_tree);
var sap = getScrollingTrees(obj_sap);
var deadTrees = getScrollingTrees(obj_deadTree);
var deadwood = getScrollingTrees(obj_deadwood);

foreground = [];
instances = [];

for (var i = 0; i < 2; i++)
{
	if (i == 0)
	{
		for (var j = 0; j < array_length(trees[i]); j++)
			array_push(foreground, trees[i][j]);
		
		for (var j = 0; j < array_length(sap[i]); j++)
			array_push(foreground, sap[i][j]);
		
		for (var j = 0; j < array_length(deadTrees[i]); j++)
			array_push(foreground, deadTrees[i][j]);
		
		for (var j = 0; j < array_length(deadwood[i]); j++)
			array_push(foreground, deadwood[i][j]);
	}
	else
	{
		for (var j = 0; j < array_length(trees[i]); j++)
			array_push(instances, trees[i][j]);
		
		for (var j = 0; j < array_length(sap[i]); j++)
			array_push(instances, sap[i][j]);
		
		for (var j = 0; j < array_length(deadTrees[i]); j++)
			array_push(instances, deadTrees[i][j]);
		
		for (var j = 0; j < array_length(deadwood[i]); j++)
			array_push(instances, deadwood[i][j]);
	}
}