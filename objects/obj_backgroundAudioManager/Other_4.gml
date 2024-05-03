switch (room)
{
	case rm_gameover:
		chase = false;
		audio_stop_all();
		audio_play_sound(snd_rain, 1, true);
		
		break;
	case rm_lv1:
		audio_play_sound(snd_waves, 0, true);
	
		break;
	case rm_lv2:
		audio_stop_sound(snd_waves);
	
		break;
}