if !array_contains(obj_cheats.levelArray, room_get_name(room)){
	array_push(obj_cheats.levelArray, room_get_name(room))
	obj_cheats.SpawnX = 1856;
	obj_cheats.SpawnY = 900;

	obj_player.x = obj_cheats.SpawnX;
	obj_player.y = obj_cheats.SpawnY;
}