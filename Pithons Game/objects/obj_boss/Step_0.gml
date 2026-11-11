
/// BOSS STEP EVENT

// DEATH CHECK
if (hp <= 0)
{
    instance_create_depth(x, y, depth, oKey);
    instance_destroy();
    exit;
}

// Check if player exists
if (instance_exists(oPlayer))
{
    var dist = point_distance(x, y, oPlayer.x, oPlayer.y);

    // CHASE: Follow the player
    if (state == "chase")
    {
        vulnerable = false;

        if (dist > attack_range)
        {
            // Find direction toward player
            var dir = point_direction(
                x, y, oPlayer.x, oPlayer.y
            );

            // Calculate movement
            var move_x = lengthdir_x(move_speed, dir);
            var move_y = lengthdir_y(move_speed, dir);

            // HORIZONTAL WALL COLLISION
            if (!place_meeting(x + move_x, y, oWall))
            {
                x += move_x;
            }

            // VERTICAL WALL COLLISION
            if (!place_meeting(x, y + move_y, oWall))
            {
                y += move_y;
            }
        }
        else
        {
            // Start charging the shockwave
            state = "charge";
            state_timer = charge_time;
        }
    }

    // CHARGE: Give the player time to dodge
    else if (state == "charge")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            // Check distance when shockwave hits
            var player_dist = point_distance(
                x, y, oPlayer.x, oPlayer.y
            );

            if (player_dist <= attack_range)
            {
                // Damage the player's health
                oPlayer.hp = max(
                    0,
                    oPlayer.hp - damage
                );
            }

            // Stun boss after attack
            state = "stun";
            state_timer = stun_time;
            vulnerable = true;
        }
    }

    // STUN: Boss is vulnerable
    else if (state == "stun")
    {
        vulnerable = true;
        state_timer--;

        if (state_timer <= 0)
        {
            vulnerable = false;
            state = "recover";
            state_timer = attack_cooldown;
        }
    }

    // RECOVER: Pause before chasing
    else if (state == "recover")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            state = "chase";
        }
    }
}
// FACE THE PLAYER WITHOUT CHANGING SPRITE SIZE
if (instance_exists(oPlayer))
{
    if (oPlayer.x < x)
    {
        // Face left
        image_xscale = original_xscale;
    }
    else if (oPlayer.x > x)
    {
        // Face right
        image_xscale = -original_xscale;
    }
}