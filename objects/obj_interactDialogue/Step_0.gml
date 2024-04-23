// if the player is in range of the dialogue and presses x, start a dialogue
if (place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("X")) && !obj_dialogue.talking)
{
	startDialogue(dialogueKey);
}