function gotoNextDialogue()
{
	with (obj_dialogue)
	{
		if (array_length(currentDialogue) - 1 == currentDialogueIndex)
			talking = false;
		else
		{
			currentDialogueIndex++;
			currentLetterCount = 0;
		}
	}
}

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