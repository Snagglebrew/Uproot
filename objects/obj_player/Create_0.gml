/// @description
hp = maxhp;
vspd = 0;
immune = false;
emptyHands = true;
_pickup = noone;

//Shader variables
_uniColor = shader_get_uniform(shdrOverlay, "u_colour");
_uniMix = shader_get_uniform(shdrOverlay, "u_mix");
_uniTransparency = shader_get_uniform(shdrOverlay, "u_transparency");
_color = [1.0, 1.0, 1.0]; //RGB values for color overlay
_mix = 0.0; // Amount shader colors are mixed with model
_transparency = 1.0; //Amount of model transparency