if (layer_exists("Rain") && !audio_is_playing(snd_rain))
{
	audio_play_sound(snd_rain, 0, true);
}
else if (!layer_exists("Rain") && audio_is_playing(snd_rain))
{
	audio_stop_sound(snd_rain);
}

if (!audio_is_playing(snd_backgroundMusicStart) && !audio_is_playing(snd_backgroundMusicLoop) && room != rm_gameover)
{
	audio_play_sound(snd_backgroundMusicLoop, -1, true);
}