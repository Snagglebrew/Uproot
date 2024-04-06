/// @description Draws shaders
shader_set(shdr_colorOverlay);
shader_set_uniform_f_array(_uniColor,_color);
shader_set_uniform_f(_uniMix, _mix);
shader_set_uniform_f(_uniTransparency, _transparency);
draw_self();
shader_reset();

if(immune){
	_color = [0.7, 0.7, 0]
	_mix = 0.2
} else {
	_mix = 0.0
	_transparency = 1.0
}

// if there is an item that can be picked up, draw the pick up text
if (place_meeting(x, y, obj_pickup) && emptyHands)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_set_color(c_white);

	draw_text(x, y - pickupTextOffset, pickupText);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}