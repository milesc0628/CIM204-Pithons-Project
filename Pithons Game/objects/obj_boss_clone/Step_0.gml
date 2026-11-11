
// =====================================
// BOSS CLONE STEP EVENT
// =====================================

// DESTROY CLONE IF BOSS IS GONE
if (!instance_exists(owner))
{
    instance_destroy();
    exit;
}

// =====================================
// ASSIGN POSITION AROUND BOSS
// =====================================

// Assign a random angle once per clone
if (!variable_instance_exists(id, "orbit_angle"))
{
    orbit_angle = irandom(359);
}

// Distance from boss
var orbit_distance = 90;

// Target position around boss
var target_x = owner.x + lengthdir_x(
    orbit_distance, orbit_angle
);

var target_y = owner.y + lengthdir_y(
    orbit_distance, orbit_angle
);

// =====================================
// MOVE TOWARD BOSS
// =====================================

var dist_to_spot = point_distance(
    x, y, target_x, target_y
);

if (dist_to_spot > 8)
{
    var dir = point_direction(
        x, y, target_x, target_y
    );

    var move_amount = min(6, dist_to_spot);

    var move_x = lengthdir_x(
        move_amount, dir
    );

    var move_y = lengthdir_y(
        move_amount, dir
    );

    // Horizontal wall collision
    if (!place_meeting(x + move_x, y, oWall))
    {
        x += move_x;
    }

    // Vertical wall collision
    if (!place_meeting(x, y + move_y, oWall))
    {
        y += move_y;
    }
}

// =====================================
// KEEP DISTANCE FROM PLAYER
// =====================================

if (instance_exists(oPlayer))
{
    var player_dist = point_distance(
        x, y, oPlayer.x, oPlayer.y
    );

    if (player_dist < keep_distance)
    {
        var away_dir = point_direction(
            oPlayer.x, oPlayer.y, x, y
        );

        var away_x = lengthdir_x(
            3, away_dir
        );

        var away_y = lengthdir_y(
            3, away_dir
        );

        if (!place_meeting(x + away_x, y, oWall))
        {
            x += away_x;
        }

        if (!place_meeting(x, y + away_y, oWall))
        {
            y += away_y;
        }
    }
}

// =====================================
// CLONE SHOOTING
// =====================================

shoot_timer--;

if (shoot_timer <= 0)
{
    boss_shoot(x, y, 4);
    shoot_timer = shoot_cooldown;
}
