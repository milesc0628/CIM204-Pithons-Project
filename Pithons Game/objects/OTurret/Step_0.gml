// Check if the player exists
if (instance_exists(oPlayer))
{
    var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);

    // Player is within turret range
    if (distance_to_player <= shoot_range)
    {

        // Shoot
        if (shoot_timer <= 0)
        {
            var bullet = instance_create_layer(x, y, "Instances", OTurretBullet);

            bullet.direction = point_direction(x, y, oPlayer.x, oPlayer.y);
            bullet.speed = bullet_speed;

            shoot_timer = shoot_delay;
        }
    }
	if (oPlayer.x < x)
    {
        image_xscale = 1;  // Face left
    }
    else
    {
        image_xscale = -1; // Face right
    }
}

// Countdown shooting timer
if (shoot_timer > 0)
{
    shoot_timer--;
}