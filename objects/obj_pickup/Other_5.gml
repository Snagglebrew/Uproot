/// @description
if(future){
	prevX = x
	prevY = y
}

if instance_exists(obj_player) then if(!obj_player.emptyHands && obj_player.pickup == self.id){
	persistent = true;
} else {
	persistent = false
}