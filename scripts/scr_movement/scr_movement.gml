function scr_movement(){
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	_up = keyboard_check_pressed(vk_up);
	var _down = keyboard_check(vk_down);
	
	if (!obj_dialogue.talking)
		hdir = _right - _left;
	else
		hdir = 0;
}