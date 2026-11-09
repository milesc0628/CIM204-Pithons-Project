// ---------- TRIGGER SPLITS (only once awake) ----------
if (aggro && state != "split")
{
    if (split_stage == 0 && hp <= max_hp * 0.5)
    {
        split_stage = 1;
        start_split(3);
    }
    else if (split_stage == 1 && hp <= max_hp * 0.2)
    {
        split_stage = 2;
        start_split(6);
    }
}

// ---------- STATES ----------
if (instance_exists(oPlayer))
{
    var dist = point_distance(x, y, oPlayer.x, oPlayer.y);

    // SLEEP until the player gets close (or the boss gets hit)
    if (!aggro)
    {
        if (dist <= aggro_range || hp < max_hp)
        {
            aggro = true;
            shoot_timer = 60;
        }
        else exit;
    }

    // CHASE
    if (state == "chase")
    {
        shoot_timer--;
        if (shoot_timer <= 0)
        {
            boss_shoot(x, y, 4);
            shoot_timer = shoot_cooldown;
        }

        vulnerable = false;

        if (dist > attack_range)
        {
            var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
            var _mx = lengthdir_x(move_speed, dir);
            var _my = lengthdir_y(move_speed, dir);
            if (!place_meeting(x + _mx, y, oWall)) x += _mx;
            if (!place_meeting(x, y + _my, oWall)) y += _my;
        }
        else
        {
            state = "charge";
            state_timer = charge_time;
        }
    }

    // CHARGE
    else if (state == "charge")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            var player_dist = point_distance(x, y, oPlayer.x, oPlayer.y);

            if (player_dist <= attack_range)
            {
                oPlayer.hp = max(0, oPlayer.hp - damage);
            }

            state = "stun";
            state_timer = stun_time;
            vulnerable = true;
        }
    }

    // STUN
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

    // RECOVER
    else if (state == "recover")
    {
        state_timer--;

        if (state_timer <= 0)
        {
            state = "chase";
        }
    }

    // SPLIT
    else if (state == "split")
    {
        vulnerable = false;
        move_timer++;

        var _arrived = (point_distance(x, y, home_x, home_y) <= 4 || move_timer > 180);

        if (!_arrived)
        {
            var _d = point_direction(x, y, home_x, home_y);
            var _sx = lengthdir_x(6, _d);
            var _sy = lengthdir_y(6, _d);
            if (!place_meeting(x + _sx, y, oWall)) x += _sx;
            if (!place_meeting(x, y + _sy, oWall)) y += _sy;
        }
        else
        {
            shoot_timer--;
            if (shoot_timer <= 0)
            {
                boss_shoot(x, y, 4);
                shoot_timer = shoot_cooldown;
            }
        }
    }
}