if (mouse_check_button_pressed(mb_left))
{
	// shorten mouse pos variables
	var mx = mouse_x;
	var my = mouse_y;
	
	var x1 = x - buttonWidth / 2,
		x2 = x + buttonWidth / 2,
		y1 = y - buttonHeight / 2,
		y2 = y + buttonHeight / 2;

	// booleans checking if the mouse is inside the button
	var insideButtonX = (mx >= x1) && (mx <= x2);
	var insideButtonY = (my >= y1) && (my <= y2);

	// if clicking the button
	if (insideButtonX && insideButtonY && obj_dialogue.canClickButtons && layer_get_visible(layer))
	{
		// activate the button event
		event_perform(ev_alarm, 0);
	}
}