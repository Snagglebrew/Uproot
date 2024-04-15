if (talking)
{
	// draw the outline of the dialogue box
	draw_set_color(outlineColor);
	draw_rectangle(0, 0, viewportWidth, dialogueBoxPixelThickness, false);

	// draw the body of the dialogue box
	draw_set_color(mainBoxColor);
	draw_rectangle(outlineThickness, outlineThickness, viewportWidth - outlineThickness, dialogueBoxPixelThickness - outlineThickness, false);

	// draw the portrait
	// TODO: need a sprite for this
	if (currentDialogue[currentDialogueIndex].talker == "diana")
		draw_set_color(c_blue);
	else
		draw_set_color(c_red);

	var tempSpriteWidth = 120, 
		tempSpriteHeight = 120;
	var initialX = outlineThickness + portraitOffsetX,
		initialY = outlineThickness + portraitOffsetY;

	draw_rectangle(
		initialX, 
		initialY,
		initialX + tempSpriteWidth, 
		initialY + tempSpriteHeight,
		false
	);

	// draw the current text for the dialogue
	var initialFont = draw_get_font();

	// TODO: dialogue font
	//draw_set_font(example font);

	// set the initialX to the point of the text
	initialX += portraitOffsetX + tempSpriteWidth;

	// split the string into an array of words
	var splitString = string_split(currentDialogue[currentDialogueIndex].text, " ");

	// loop over every word to manually wrap it
	var wrappedString = "";
	var currString = "";
	for (var i = 0; i < array_length(splitString); i++)
	{
		var word = splitString[i];
	
		// if the width (in pixels) of the current string + the next word is too big, 
		// add a new line and continue adding
		if (string_width(currString + word) > viewportWidth - outlineThickness - textMarginX - initialX)
		{
			wrappedString += currString + "\n";
		
			currString = word + " ";
		}
		else
			currString += word + " ";
	}

	// add the final sentence to the final string
	wrappedString += currString;
	
	// set object variables
	currentTextLength = string_length(wrappedString);
	currentLetterCount += lettersPerSecond / global.gameFPS;
	
	// finish the final string
	// if the current letter count is the whole string, skip the substring loop
	var finalString = "";
	if (currentLetterCount >= currentTextLength)
	{
		currentLetterCount = currentTextLength;
		
		finalString = wrappedString;
	}
	else
	{
		// only render the letters we have
		for (var i = 0; i < ceil(currentLetterCount); i++)
		{
			// ignore new line characters
			var char = string_char_at(wrappedString, i);
			if (char == "\n")
				currentLetterCount++;
			
			finalString += char;
		}
		
		finalString = string_delete(finalString, 0, 1);
	}

	draw_set_color(c_white);

	draw_text(initialX, initialY, finalString);

	draw_set_font(initialFont);
}