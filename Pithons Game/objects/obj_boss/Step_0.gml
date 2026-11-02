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
            var dir = point_direction(x, y, oPlayer.x, oPlayer.y);

            x += lengthdir_x(move_speed, dir);
            y += lengthdir_y(move_speed, dir);
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
            // Check distance when the shockwave hits
            var player_dist = point_distance(
                x, y, oPlayer.x, oPlayer.y
            );

            if (player_dist <= attack_range)
            {
                // Damage the player's health
                oPlayer.hp = max(0, oPlayer.hp - damage);
            }

            // Stun the boss after the attack
            state = "stun";
            state_timer = stun_time;
            vulnerable = true;
        }
    }

    // STUN: Boss is vulnerable to extra damage
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

    // RECOVER: Pause before chasing again
    else if (state == "recover")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            state = "chase";
        }
    }
}