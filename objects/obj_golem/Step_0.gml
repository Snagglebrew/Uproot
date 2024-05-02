var floorObject = collision_line(x, y, x, y + 1000, obj_floor, false, false);

if (instance_exists(floorObject))
{
	y = floorObject.bbox_top - sprite_height / 2;
}

if (obj_exit.goal && !active)
{
	active = true;
	
	sprite_index = spr_golem_assemble;
}

if (active && sprite_index == spr_golem_assemble && image_index == 15)
{
	sprite_index = spr_golem_Chase;
}
else if (active && instance_exists(obj_player) && sprite_index == spr_golem_Chase)
{
	speed = 2 * sign(obj_player.x - x);
}