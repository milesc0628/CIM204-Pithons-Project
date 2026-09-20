var _player = instance_nearest(x, y, oPlayer);

if (_player != noone) {
    if (!chasing) {
        chasing = true;
        music_id = audio_play_sound(snd_chase_music, 1, true);
    }

    var _dir = point_direction(x, y, _player.x, _player.y);
    var _spd = 2;
    x += lengthdir_x(_spd, _dir);
    y += lengthdir_y(_spd, _dir);

} else {
    if (chasing) {
        chasing = false;
        if (audio_is_playing(music_id)) {
            audio_stop_sound(music_id);
        }
        music_id = -1;
    }
}