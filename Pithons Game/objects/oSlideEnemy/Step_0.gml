// =====================================
// ENEMY STEP EVENT
// =====================================

// =====================================
// DEATH CHECK
// =====================================
if (Enemyhealth <= 0)
{
    instance_destroy();
    exit;
}

// =====================================
// FIND PLAYER
// =====================================
if (!instance_exists(oPlayer))
{
    exit;
}

var _player = instance_nearest(x, y, oPlayer);

if (_player.hp <= 0)
{
    exit;
}

// =====================================
// FACE PLAYER
// =====================================
if (_player.x < x)
{
    image_xscale = 1;
}
else
{
    image_xscale = -1;
}

// =====================================
// STATE 1: IDLE
// =====================================
if (state == "idle")
{
    start_delay--;

    if (start_delay <= 0)
    {
        state = "approach";
        chasing = true;
    }
}

// =====================================
// STATE 2: APPROACH PLAYER
// =====================================
else if (state == "approach")
{
    var _dist = point_distance(
        x, y,
        _player.x, _player.y
    );

    // Move toward player
    if (_dist > attack_range)
    {
        var _dir = point_direction(
            x, y,
            _player.x, _player.y
        );

        var _mx = lengthdir_x(move_speed, _dir);
        var _my = lengthdir_y(move_speed, _dir);

        // Wall collision
        if (!place_meeting(x + _mx, y, oWall))
        {
            x += _mx;
        }

        if (!place_meeting(x, y + _my, oWall))
        {
            y += _my;
        }
    }
    else
    {
        // =====================================
        // DAMAGE PLAYER
        // =====================================
        _player.hp = max(
            0,
            _player.hp - attack_damage
        );

        // Player death
        if (_player.hp <= 0)
        {
            room_goto(rmGameOver);
            exit;
        }

        // =====================================
        // START RETREAT
        // =====================================
        retreat_direction = point_direction(
            _player.x, _player.y,
            x, y
        );

        retreat_remaining = retreat_distance;

        state = "retreat";
    }
}

// =====================================
// STATE 3: RETREAT
// =====================================
else if (state == "retreat")
{
    if (retreat_remaining > 0)
    {
        var _step = min(
            retreat_speed,
            retreat_remaining
        );

        var _mx = lengthdir_x(
            _step, retreat_direction
        );

        var _my = lengthdir_y(
            _step, retreat_direction
        );

        var _moved = false;

        if (!place_meeting(x + _mx, y, oWall))
        {
            x += _mx;
            _moved = true;
        }

        if (!place_meeting(x, y + _my, oWall))
        {
            y += _my;
            _moved = true;
        }

        if (_moved)
        {
            retreat_remaining -= _step;
        }
        else
        {
            // Stop retreating if blocked
            retreat_remaining = 0;
        }
    }

    // Finished backing away
    if (retreat_remaining <= 0)
    {
        state = "cooldown";
        cooldown_timer = attack_cooldown;
    }
}

// =====================================
// STATE 4: COOLDOWN
// =====================================
else if (state == "cooldown")
{
    cooldown_timer--;

    if (cooldown_timer <= 0)
    {
        state = "approach";
    }
}