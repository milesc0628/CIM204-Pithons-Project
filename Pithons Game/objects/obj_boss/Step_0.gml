if (instance_exists(obj_player))
{
    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    // CHASE: Follow the player
    if (state == "chase")
    {
        vulnerable = false;

        if (dist > attack_range)
        {
            var dir = point_direction(
                x, y, obj_player.x, obj_player.y
            );

            x += lengthdir_x(move_speed, dir);
            y += lengthdir_y(move_speed, dir);
        }
        else
        {
            // Start charging the shockwave
            state = "charge";
            state_timer = charge_time;
            shockwave_hit = false;
        }
    }

    // CHARGE: Warn the player before attacking
    else if (state == "charge")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            // Release the shockwave
            if (!shockwave_hit)
            {
                if (dist <= attack_range)
                {
                    if (variable_instance_exists(obj_player, "hp"))
                    {
                        obj_player.hp -= damage;
                    }
                }

                shockwave_hit = true;
            }

            // Become stunned and vulnerable
            state = "stun";
            state_timer = stun_time;
            vulnerable = true;
        }
    }

    // STUN: Player gets a damage window
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

    // RECOVER: Brief pause before chasing again
    else if (state == "recover")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            state = "chase";
        }
    }
}