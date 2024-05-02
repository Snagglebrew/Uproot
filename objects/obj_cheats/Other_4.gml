/// @description Insert description here
// You can write your code in this editor
if(room != rm_gameover && !swapRoom){
	room_persistent = true;
} else if (swapRoom && firstClear)
{ 
	room_persistent = false;
	firstClear = false;
	if string_ends_with(room_get_name(deathroom),"Future") {
		var _rm = room_get_name(deathroom);
		_rm = string_delete(_rm, (string_length(_rm) - 5), 6);
		_rm = asset_get_index(_rm);
		room_goto(_rm)
	} else if(!string_ends_with(room_get_name(deathroom), "Future")) {
		var _rm = room_get_name(deathroom);
		_rm = _rm + "Future"
		_rm = asset_get_index(_rm);
		if room_exists(_rm)
			room_goto(_rm)
	}
} else if (swapRoom && !firstClear) { 
	room_persistent = false;
	var _rm = room_get_name(deathroom);
	_rm = asset_get_index(_rm)
	room_goto(_rm);
	swapRoom = false;
	firstClear = true;
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