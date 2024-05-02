// hide object when game starts
//visible = false;

// add the blocking rain shader to the rain layer if other objects havent so far
if (layer_exists("Rain") && !layer_get_shader("Rain"))
{
    layer_shader("Rain", sdr_unrenderRain);
    layer_script_begin("Rain", unrenderRainSetUniforms);
}