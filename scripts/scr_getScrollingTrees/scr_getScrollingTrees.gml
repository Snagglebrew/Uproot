// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getScrollingTrees(obj_index)
{
	var foregroundObjects = [];
	var instanceObjects = [];

	with (obj_index)
	{
		switch(layer_get_name(layer))
		{
			case "ForegroundInstances":
				foregroundObjects[array_length(foregroundObjects)] = id;
		
				break;
			case "Instances":
				instanceObjects[array_length(instanceObjects)] = id;
		
				break;
		}
	}
	
	return [foregroundObjects, instanceObjects];
}