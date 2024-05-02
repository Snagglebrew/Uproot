/// @description Insert description here
// You can write your code in this editor
obj_cheats.deathroom = room;
instance_create_layer(x, y, "Instances", obj_fadeTransition, {roomToTransitionTo: rm_gameover, colorOfTransition: c_red, secondsToTransition: 1, hasEasing: true});