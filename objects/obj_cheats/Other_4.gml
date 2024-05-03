/// @description Insert description here
// You can write your code in this editor

if(room != rm_gameover && !swapRoom){
	room_persistent = true;
} else {
	room_persistent = false
}

if(reset){
	with obj_pickup{
		x = SpawnX
		y = SpawnY
	}
	reset = false;
}
	
if(string_ends_with(room_get_name(room), "Future")){
	var _layers = layer_get_all()
	for(var i = 0; i < array_length(_layers); i++){
		if(layer_get_name(_layers[i]) != "Rain"){
			layer_script_begin(_layers[i], scr_layerShaderStart)
			layer_script_end(_layers[i], scr_layerShaderEnd)
		}
	}
}