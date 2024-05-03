
if !array_contains(obj_cheats.levelArray, room_get_name(room)){
	array_push(obj_cheats.levelArray, room_get_name(room))
	obj_cheats.SpawnX = 1184
	obj_cheats.SpawnY = 928
}