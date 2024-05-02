for (var i = 0; i < array_length(foreground); i++)
{
	var obj = foreground[i];
	var sw = abs(obj.sprite_width);
	
	obj.speed = foregroundSpeed;
	
	switch (obj.sprite_index)
	{
		case spr_tree: case spr_deadwood:
			if (obj.x + sw / 2 < 0)
				obj.x = room_width + sw / 2 + irandom(maxXOffset);
				
			break;
		case spr_sap: case spr_deadTree:
			if (obj.image_xscale > 0)
			{
				if (obj.x + sw < 0)
					obj.x = room_width + irandom(maxXOffset);
			}
			else
			{
				if (obj.x < 0)
					obj.x = room_width + sw + irandom(maxXOffset);
			}
		
			break;
	}
}

for (var i = 0; i < array_length(instances); i++)
{
	var obj = instances[i];
	var sw = abs(obj.sprite_width);
	
	obj.speed = instancesSpeed;
	
	switch (obj.sprite_index)
	{
		case spr_tree: case spr_deadwood:
			if (obj.x + sw / 2 < 0)
				obj.x = room_width + sw / 2 + irandom(maxXOffset);
				
			break;
		case spr_sap: case spr_deadTree:
			if (obj.image_xscale > 0)
			{
				if (obj.x + sw < 0)
					obj.x = room_width + irandom(maxXOffset);
			}
			else
			{
				if (obj.x < 0)
					obj.x = room_width + sw + irandom(maxXOffset);
			}
		
			break;
	}
}