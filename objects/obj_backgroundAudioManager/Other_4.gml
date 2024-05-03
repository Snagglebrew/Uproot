switch (room)
{
	case rm_gameover:
		audio_stop_all();
		audio_play_sound(snd_rain, 1, true);
		chase = false;
		
		break;
	case rm_lv1:
		audio_play_sound(snd_waves, 0, true);
	
		break;
	case rm_lv2:
		audio_stop_sound(snd_waves);
	
		break;
	case rm_lv3:
		audio_stop_sound(snd_rain);
		
		break;
	case rm_end:
		chase = false;	

		break;
}