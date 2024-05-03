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
		obj_player.emptyHands = true;
	}
	
	obj_player.x = obj_cheats.SpawnX
	obj_player.y = obj_cheats.SpawnY
	obj_cheats.swapRoom = true;
	obj_cheats.doublereset = true;
}