/// @description Insert description here
// You can write your code in this editor
if (swapRoom) {
	var _oRoom = room_get_name(deathroom);
	if(string_ends_with(_oRoom, "Future")){
		_oRoom = string_delete(_oRoom, string_length(_oRoom) - 5, 6);
		_oRoom = asset_get_index(_oRoom)
	} else {
		_oRoom = _oRoom + "Future"
		_oRoom = asset_get_index(_oRoom)
	}
	
	if firstClear{
		room_goto(_oRoom);
		room_set_persistent(deathroom, false);
		firstClear = false;
	} else {
		room_goto(deathroom)
		swapRoom = false;
		firstClear = true;
	}
	reset = true;
}