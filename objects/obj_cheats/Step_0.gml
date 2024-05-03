/// @description Insert description here
// You can write your code in this editor
if (swapRoom) {
	_oRoom = room_get_name(deathroom);
	if(string_ends_with(_oRoom, "Future")){
		_oRoom = string_delete(_oRoom, string_length(_oRoom) - 5, 6);
		_oRoom = asset_get_index(_oRoom)
	} else {
		_oRoom = _oRoom + "Future"
		_oRoom = asset_get_index(_oRoom)
	}
	
	if firstClear{
		if(_oRoom != -1){
			room_set_persistent(_oRoom, false);
			travel = true;
		}
		room_set_persistent(deathroom, false);
		firstClear = false;
	} else {
		swapRoom = false;
		travel = true;
		firstClear = true;
	}
	reset = true;
}