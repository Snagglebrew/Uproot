/// goes to the next dialogue
function gotoNextDialogue()
{
	with (obj_dialogue)
	{
		// if we are at the last piece of dialogue, stop talking
		if (array_length(currentDialogue) - 1 == currentDialogueIndex)
			talking = false;
		// else start the next dialogue
		else
		{
			currentDialogueIndex++;
			currentLetterCount = 0;
		}
	}
}

/// starts dialogue with a given dialogue key
function startDialogue(dialogueKey)
{
	with (obj_dialogue)
	{
		currentDialogue = dialogueOptions[?dialogueKey];
		currentDialogueIndex = 0;
		currentLetterCount = 0;
		currentTextLength = 0;
		
		talking = true;
	}
}