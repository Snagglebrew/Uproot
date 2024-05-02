var percentOverScreen = frameCount / (secondsToTransition * global.gameFPS);

// room transition while everything is obscured
// comes 1 frame after the screen is technically obscured since the lag
// when going to another room will leave a sliver of the room to be seen
if (frameCount - 1 == (secondsToTransition * global.gameFPS))
{
	room_goto(roomToTransitionTo);
}
// fade out
else if (percentOverScreen > 1 && percentOverScreen <= 2)
	percentOverScreen = 2 - percentOverScreen;
// finish transition
else if (percentOverScreen > 2)
{
	percentOverScreen = 0;
	instance_destroy();
}

if (hasEasing)
	percentOverScreen = 1 - power(1 - percentOverScreen, 3);

// draw a rectangle over the whole room
draw_set_color(colorOfTransition);
draw_rectangle(0, 0, view_wport[0] * percentOverScreen, view_hport[0], false);
frameCount++;