if (layer_exists("Rain") && layer_get_visible("Rain") && !audio_is_playing(snd_rain))
{
	audio_play_sound(snd_rain, 0, true);
}
else if (!layer_exists("Rain") && audio_is_playing(snd_rain))
{
	audio_stop_sound(snd_rain);
}

if (!audio_is_playing(snd_backgroundMusicStart) && !audio_is_playing(snd_backgroundMusicLoop) && room != rm_gameover && !chase)
{
	audio_play_sound(snd_backgroundMusicLoop, -1, true);
}
else if (!audio_is_playing(snd_chase) && chase)
{
	audio_stop_sound(snd_backgroundMusicLoop);
	audio_stop_sound(snd_backgroundMusicStart);
	
	audio_play_sound(snd_chase, -1, true);
}