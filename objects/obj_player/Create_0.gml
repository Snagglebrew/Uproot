/// @description
hp = maxhp;
vspd = 0;
immune = false;
emptyHands = true;
pickup = noone;
future = true
travel = false
prevX = 0
prevY = 0
prevHspd = 0
prevVspd = 0

//Shader variables
_uniColor = shader_get_uniform(shdr_colorOverlay, "u_colour");
_uniMix = shader_get_uniform(shdr_colorOverlay, "u_mix");
_uniTransparency = shader_get_uniform(shdr_colorOverlay, "u_transparency");
_color = [1.0, 1.0, 1.0]; //RGB values for color overlay
_mix = 0.0; // Amount shader colors are mixed with model
_transparency = 1.0; //Amount of model transparency