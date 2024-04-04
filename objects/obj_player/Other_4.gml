/// @description
if(travel){
	travel = false
	x = prevX
	y = prevY
	hspd = prevHspd
	vspd = prevVspd
}
if(string_ends_with(room_get_name(room), "Future")){
	future = true
} else {
	future = false
}
