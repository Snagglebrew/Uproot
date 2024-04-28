global._up = 0;
function scr_movement(){
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _down = keyboard_check(vk_down);
	
	if (!obj_dialogue.talking)
	{
		hdir = _right - _left;
		
		if keyboard_check_pressed(vk_up)
			global._up = 3
		else if global._up > 0
			global._up--;
	}
	else
		hdir = 0;
}