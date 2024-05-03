var leftFloor = collision_line(x - sprite_width / 2, y, x - sprite_width / 2, y + 1000, obj_floor, false, false);
var rightFloor = collision_line(x + sprite_width / 2, y, x + sprite_width / 2, y + 1000, obj_floor, false, false);

if (instance_exists(leftFloor) && leftFloor.object_index != obj_shrine)
{
	if (instance_exists(rightFloor) && rightFloor.object_index != obj_shrine && leftFloor.x == rightFloor.x)
	{
		y = leftFloor.bbox_top - sprite_height / 2;
	}
}

if (instance_exists(obj_exit) && obj_exit.goal && !active)
{
	active = true;
	
	sprite_index = spr_golem_assemble;
}

if (active && sprite_index == spr_golem_assemble && image_index == 14)
{
	sprite_index = spr_golem_Chase;
	
	audio_play_sound(snd_roar, 1, false);
	
	obj_backgroundAudioManager.chase = true;
}
else if (active && instance_exists(obj_player) && sprite_index == spr_golem_Chase)
{
	speed = moveSpeed * sign(obj_player.x - x);
	
	image_xscale = sign(speed) * startingXScale;
}

if (stopMoving)
	speed = 0;