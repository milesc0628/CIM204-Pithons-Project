var _player = instance_nearest(x, y, obj_player);

if (_player != noone) {
    var _dir = point_direction(x, y, _player.x, _player.y);
    var _spd = 2;
    x += lengthdir_x(_spd, _dir);
    y += lengthdir_y(_spd, _dir);
}
// Count down the flash timer each frame
if (flash_timer > 0) {
    flash_timer -= 1;
}

// Check for death
if (hp <= 0) {
    instance_destroy();
}