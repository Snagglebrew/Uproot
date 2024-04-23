/// @description Insert description here
// You can write your code in this editor
deathroom = undefined;
SpawnX = 0
SpawnY = 0
swapRoom = false;

//Shader variables
_uniColor = shader_get_uniform(shdr_colorOverlay, "u_colour");
_uniMix = shader_get_uniform(shdr_colorOverlay, "u_mix");
_uniTransparency = shader_get_uniform(shdr_colorOverlay, "u_transparency");
_color = [0.0, 0.0, 0.0]; //RGB values for color overlay
_mix = 0.0; // Amount shader colors are mixed with model
_transparency = 1.0; //Amount of model transparency