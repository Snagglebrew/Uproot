// since there is only one of this option, i just set the global for game fps here
global.gameFPS = game_get_speed(gamespeed_fps);

// getting the viewport width
viewportWidth = view_wport[0];

/// IF YOU WANT TO CREATE YOUR OWN DIALOGUE, FOLLOW THIS FORMAT
/// ONCE CREATED, ADD IT TO THE MAP USING THE FUNCTION BELOW
// the order of the structs (each thing enclosed by curly brackets) matters, as its the order of the dialogue
// FOR NOW, the talker variable doesnt really do much,
// but if you add any, add to this list of talkers for later: diana, gaia
var testDialogue = [
	{
		text: "test text 1",
		talker: "diana"
	},
	{
		text: "test text 2",
		talker: "gaia"
	}
];
var deadWood = [
	{
		text: "Oh no...this poor trees life has reached it's end",
		talker: "diana"
	},
	{
		text: "If only I had a way to set it's spirit free.",
		talker: "diana"
	}
];

// create the dialogue options map
dialogueOptions = ds_map_create();

/// ADD YOUR DIALOGUE USING THIS FUNCTION
ds_map_set(dialogueOptions, "testDialogue", testDialogue);
ds_map_set(dialogueOptions, "deadWood", deadWood);

// all dialogue variables
currentDialogue = [];
currentDialogueIndex = 0;
currentLetterCount = 0;
currentTextLength = 0;
talking = false;