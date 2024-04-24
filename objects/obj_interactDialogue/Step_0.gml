// if the player is in range of the dialogue and presses x, start a dialogue
if (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("X")))
{
	// if we are talking
	if (obj_dialogue.talking)
	{
		// if we are at the end of the current dialogue, go to the next
		if (obj_dialogue.currentLetterCount >= obj_dialogue.currentTextLength)
			gotoNextDialogue();
		// else put all of the dialogue on screen
		else
			obj_dialogue.currentLetterCount = obj_dialogue.currentTextLength;
	}
	// if we arent already talking, start this dialogue
	else
		startDialogue(dialogueKey);
}