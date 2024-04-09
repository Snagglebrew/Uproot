/// @description
if(future){
	prevX = x
	prevY = y
}

if instance_exists(obj_player) then if(!obj_player.emptyHands && obj_player.pickup == self.id && !blocked){
	persistent = true;
} else if !blocked {
	persistent = false
}