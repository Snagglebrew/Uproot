function scr_movement(){
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	_up = keyboard_check(vk_up);
	var _down = keyboard_check(vk_down);
	
	hdir = _right - _left;
}