/// @description Insert description here
// You can write your code in this editor
if(room != rm_gameover && !swapRoom){
	room_persistent = true;
} else if swapRoom { room_persistent = false; }

var _layers = layer_get_all()
for(var i = 0; i < array_length(_layers); i++){
	//if(layer_get_name(_layers[i]) != "Instances"){
		layer_shader(_layers[i],shdr_colorOverlay);
	//}
}
if(string_ends_with(room_get_name(room), "Future")){
	_mix = 0.25;
	_transparency = 1.0;
}