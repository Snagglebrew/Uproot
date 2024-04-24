if (keyboard_check_pressed(ord("X")))
{
	// if we are talking
	if (talking)
	{
		// if we are at the end of the current dialogue, go to the next
		if (currentLetterCount >= currentTextLength)
			gotoNextDialogue();
		// else put all of the dialogue on screen
		else
			currentLetterCount = currentTextLength;
	}
	// test to manually start dialogue
	//else
		//startDialogue("testDialogue");
}