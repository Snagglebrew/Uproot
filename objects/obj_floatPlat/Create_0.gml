/// @description
if(path != noone)
	path_start(path, pathSpeed, path_action_restart, true);

if (blockRainObject != noone)
{
	blockRainObject.image_xscale = sprite_width / sprite_get_width(blockRainObject.sprite_index);
}