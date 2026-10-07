// Check if the player exists
if (instance_exists(obj_player))
{
    var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    // Player is within turret range
    if (distance_to_player <= shoot_range)
    {

        // Shoot
        if (shoot_timer <= 0)
        {
            var bullet = instance_create_layer(x, y, "Instances", obj_turret_bullet);

            bullet.direction = point_direction(x, y, obj_player.x, obj_player.y);
            bullet.speed = bullet_speed;

            shoot_timer = shoot_delay;
        }
    }
}

// Countdown shooting timer
if (shoot_timer > 0)
{
    shoot_timer--;
}
