
// =====================================
// FINAL BOSS STEP EVENT
// =====================================

// DEATH CHECK
if (hp <= 0)
{
    instance_create_depth(x, y, depth, oKey);
    instance_destroy();
    exit;
}

// =====================================
// WAKE UP BOSS
// =====================================

if (!instance_exists(oPlayer))
{
    exit;
}

var dist = point_distance(
    x, y, oPlayer.x, oPlayer.y
);

// Sleep until player gets close or boss is hit
if (!aggro)
{
    if (dist <= aggro_range || hp < max_hp)
    {
        aggro = true;
        shoot_timer = 60;
    }
    else
    {
        exit;
    }
}

// =====================================
// TRIGGER GLOWING PHASES
// =====================================

if (!glow_phase)
{
    // First glowing phase at 50% HP
    if (split_stage == 0 && hp <= max_hp * 0.5)
    {
        start_split(3);
    }

    // Second glowing phase at 20% HP
    else if (split_stage == 1 && hp <= max_hp * 0.2)
    {
        start_split(6);
    }
}

// =====================================
// GLOWING COMBAT PHASE
// =====================================

if (state == "glow")
{
    vulnerable = true;

    glow_timer--;

    // ---------------------------------
    // CHASE PLAYER
    // ---------------------------------

    if (dist > melee_range)
    {
        var dir = point_direction(
            x, y, oPlayer.x, oPlayer.y
        );

        var move_x = lengthdir_x(
            move_speed, dir
        );

        var move_y = lengthdir_y(
            move_speed, dir
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

    // ---------------------------------
    // PROJECTILE ATTACK
    // ---------------------------------

    shoot_timer--;

    if (shoot_timer <= 0)
    {
        boss_shoot(x, y, 9);
        shoot_timer = shoot_cooldown;
    }

    // ---------------------------------
    // MELEE ATTACK
    // ---------------------------------

    melee_timer--;

    if (melee_timer <= 0)
    {
        var melee_dist = point_distance(
            x, y, oPlayer.x, oPlayer.y
        );

        if (melee_dist <= melee_range)
        {
            oPlayer.hp = max(
                0,
                oPlayer.hp - melee_damage
            );

            melee_timer = melee_cooldown;
        }
        else
        {
            melee_timer = 0;
        }
    }

    // ---------------------------------
    // END GLOWING PHASE
    // ---------------------------------

    if (glow_timer <= 0)
    {
        glow_phase = false;
        vulnerable = false;

        state = "chase";
        shoot_timer = shoot_cooldown;
    }
}

// =====================================
// NORMAL CHASE
// =====================================

else if (state == "chase")
{
    vulnerable = false;

    // Shoot projectiles
    shoot_timer--;

    if (shoot_timer <= 0)
    {
        boss_shoot(x, y, 4);
        shoot_timer = shoot_cooldown;
    }

    // Chase player
    if (dist > attack_range)
    {
        var dir = point_direction(
            x, y, oPlayer.x, oPlayer.y
        );

        var move_x = lengthdir_x(
            move_speed, dir
        );

        var move_y = lengthdir_y(
            move_speed, dir
        );

        if (!place_meeting(x + move_x, y, oWall))
        {
            x += move_x;
        }

        if (!place_meeting(x, y + move_y, oWall))
        {
            y += move_y;
        }
    }
    else
    {
        state = "charge";
        state_timer = charge_time;
    }
}

// =====================================
// NORMAL CHARGE
// =====================================

else if (state == "charge")
{
    state_timer--;

    if (state_timer <= 0)
    {
        var player_dist = point_distance(
            x, y, oPlayer.x, oPlayer.y
        );

        if (player_dist <= attack_range)
        {
            oPlayer.hp = max(
                0,
                oPlayer.hp - damage
            );
        }

        state = "stun";
        state_timer = stun_time;
        vulnerable = true;
    }
}

// =====================================
// NORMAL STUN
// =====================================

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

// =====================================
// NORMAL RECOVER
// =====================================

else if (state == "recover")
{
    state_timer--;

    if (state_timer <= 0)
    {
        state = "chase";
    }
}
// FACE THE PLAYER
if (instance_exists(oPlayer))
{
    if (oPlayer.x < x)
    {
        image_xscale = 1;  // Face left
    }
    else
    {
        image_xscale = -1; // Face right
    }
}