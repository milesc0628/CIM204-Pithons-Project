function boss_shoot(_x, _y, _spd)
{
    if (!instance_exists(oPlayer)) exit;
    var _b = instance_create_depth(_x, _y, -50, oBossBullet);
    _b.direction = point_direction(_x, _y, oPlayer.x, oPlayer.y);
    _b.speed = _spd;
    _b.image_angle = _b.direction;
}
