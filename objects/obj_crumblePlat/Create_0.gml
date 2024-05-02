// Inherit the parent event
event_inherited();
image_speed = 0;

if (blockRainObject != noone)
{
	blockRainObject.image_xscale = sprite_width / sprite_get_width(blockRainObject.sprite_index);
}