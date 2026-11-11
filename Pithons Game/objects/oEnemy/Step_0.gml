var _player = instance_nearest(x, y, oPlayer);

if (_player != noone) {
    var _dir = point_direction(x, y, _player.x, _player.y);
    var _spd = 2;
    x += lengthdir_x(_spd, _dir);
    y += lengthdir_y(_spd, _dir);
}

if (instance_exists(oPlayer))
{
    var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
	
	 if (oPlayer.x < x)
    {
        image_xscale = 1;  // Face left
    }
    else
    {
        image_xscale = -1; // Face right
    }
}