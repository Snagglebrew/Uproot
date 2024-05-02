/// @description
if(goal or room_get_name(room) == "rm_intro")
{
	room_persistent = false;
	instance_create_layer(0, 0, "Instances", obj_moveTransition, {roomToTransitionTo: room_next(room)});
	instance_destroy();
}