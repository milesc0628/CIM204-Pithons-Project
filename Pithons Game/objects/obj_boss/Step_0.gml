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
            var dir = point_direction(
                x, y,
                oPlayer.x, oPlayer.y
            );

            x += lengthdir_x(move_speed, dir);
            y += lengthdir_y(move_speed, dir);
        }
        else
        {
            // Start charging shockwave
            state = "charge";
            state_timer = charge_time;
            shockwave_hit = false;
        }
    }

    // CHARGE: Warn the player
    else if (state == "charge")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            // Release shockwave once
            if (!shockwave_hit)
            {
                var player_dist = point_distance(
                    x, y,
                    oPlayer.x, oPlayer.y
                );

                if (player_dist <= attack_range)
                {
                    if (variable_instance_exists(oPlayer, "hp"))
                    {
                        oPlayer.hp -= damage;
                    }
                }

                shockwave_hit = true;
            }

            // Stun the boss after attacking
            state = "stun";
            state_timer = stun_time;
            vulnerable = true;
        }
    }

    // STUN: Vulnerable to extra damage
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