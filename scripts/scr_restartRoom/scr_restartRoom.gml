// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function restartRoom()
{
	room_persistent = false;
	if(room != rm_gameover){
		obj_cheats.deathroom = room;
		room_goto(rm_gameover);
	}
	room_set_persistent(obj_cheats.deathroom, false);
	if (!instance_exists(obj_player)){
		instance_create_layer(x,y,"Instances",obj_player);
	} else {
		obj_player.pickup = noone;
	}
	with obj_pickup{
		x = obj_cheats.SpawnX;
		y = obj_cheats.SpawnY;
	}
	
	with (obj_crumblePlat)
	{
		instance_activate_object(self);
	}
	
	if string_ends_with(room_get_name(obj_cheats.deathroom),"Future") {
		var _rm = room_get_name(obj_cheats.deathroom);
		_rm = string_delete(_rm, (string_length(_rm) - 5), 6);
		_rm = asset_get_index(_rm);
		room_goto(_rm)
	} else if(!string_ends_with(room_get_name(obj_cheats.deathroom), "Future")) {
		var _rm = room_get_name(obj_cheats.deathroom);
		_rm = _rm + "Future"
		_rm = asset_get_index(_rm);
		if room_exists(_rm)
			room_goto(_rm)
	}
	obj_player.x = obj_cheats.SpawnX
	obj_player.y = obj_cheats.SpawnY
	obj_cheats.swapRoom = true;
}