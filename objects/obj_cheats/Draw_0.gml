/// @description Insert description here
// You can write your code in this editor
shader_set(shdr_colorOverlay);
shader_set_uniform_f_array(_uniColor,_color);
shader_set_uniform_f(_uniMix, _mix);
shader_set_uniform_f(_uniTransparency, _transparency);
shader_reset();