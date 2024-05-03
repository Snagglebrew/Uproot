stopMoving = true;

alarm[0] = wallSmashSeconds * global.gameFPS;

instance_destroy(other);

audio_play_sound(snd_rockSmash, 1, false);