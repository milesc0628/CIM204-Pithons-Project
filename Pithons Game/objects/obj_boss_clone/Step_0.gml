if (!instance_exists(owner)) { instance_destroy(); exit; }

move_timer++;

var _arrived = (point_distance(x, y, home_x, home_y) <= 4 || move_timer > 180);

if (!_arrived)
{
    // walk to its spot
    var _d = point_direction(x, y, home_x, home_y);
    var _mx = lengthdir_x(6, _d);
    var _my = lengthdir_y(6, _d);
    if (!place_meeting(x + _mx, y, oWall)) x += _mx;
    if (!place_meeting(x, y + _my, oWall)) y += _my;
}
else
{
    // keep distance: back away if the player gets too close
    if (instance_exists(oPlayer))
    {
        if (point_distance(x, y, oPlayer.x, oPlayer.y) < keep_distance)
        {
            var _away = point_direction(oPlayer.x, oPlayer.y, x, y);
            var _ax = lengthdir_x(3, _away);
            var _ay = lengthdir_y(3, _away);
            if (!place_meeting(x + _ax, y, oWall)) x += _ax;
            if (!place_meeting(x, y + _ay, oWall)) y += _ay;
        }
    }

    // shoot with the same bullet as the boss
    shoot_timer--;
    if (shoot_timer <= 0)
    {
        boss_shoot(x, y, 4);
        shoot_timer = shoot_cooldown;
    }
}