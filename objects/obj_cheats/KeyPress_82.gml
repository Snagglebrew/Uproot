/// @description Restart Level

//Restart Room
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
room_goto(deathroom);
obj_player.x = SpawnX
obj_player.y = SpawnY
room_persistent = true;

if string_ends_with(room_get_name(deathroom),"Future") {
	var _rm = room_get_name(deathroom);
	_rm = string_delete(_rm, (string_length(_rm) - 5), 6);
	_rm = asset_get_index(_rm);
	room_set_persistent(_rm, false);
	room_set_persistent(_rm, true);
} else if(!string_ends_with(room_get_name(deathroom), "Future")) {
	var _rm = room_get_name(deathroom);
	_rm = _rm + "Future"
	_rm = asset_get_index(_rm);
	show_debug_message(_rm);
	room_set_persistent(_rm, false);
	room_set_persistent(_rm, true);
}
with obj_pickup{
	x = SpawnX;
	y = SpawnY;
}