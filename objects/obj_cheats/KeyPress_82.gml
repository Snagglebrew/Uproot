/// @description Restart Level

//Restart Room
room_persistent = false;
if(room != rm_gameover){
	deathroom = room;
	room_goto(rm_gameover);
}
room_set_persistent(deathroom, false);
if (!instance_exists(obj_player)){
	instance_create_layer(x,y,"Instances",obj_player);
} else {
	obj_player.pickup = noone;
}
with obj_pickup{
	x = SpawnX;
	y = SpawnY;
}
if string_ends_with(room_get_name(deathroom),"Future") {
	var _rm = room_get_name(deathroom);
	_rm = string_delete(_rm, (string_length(_rm) - 5), 6);
	_rm = asset_get_index(_rm);
	room_goto(_rm)
} else if(!string_ends_with(room_get_name(deathroom), "Future")) {
	var _rm = room_get_name(deathroom);
	_rm = _rm + "Future"
	_rm = asset_get_index(_rm);
	room_goto(_rm)
	
}
obj_player.x = SpawnX
obj_player.y = SpawnY
swapRoom = true;