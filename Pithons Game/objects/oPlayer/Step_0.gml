// =====================
// GAME OVER CHECK
// =====================

if (hp <= 0)
{
    hp = 0;
    game_over = true;
}

if (game_over)
{
    if (keyboard_check_pressed(ord("R")))
    {
        room_restart();
    }

    exit;
}


// =====================
// DASH MOVEMENT
// =====================




var dash_distance = 1000;

// SHIFT HELD
if (keyboard_check(vk_shift) && mana >= 10)
{
    var move_x = 0;
    var move_y = 0;

    if (keyboard_check(ord("A"))) move_x -= 1;
    if (keyboard_check(ord("D"))) move_x += 1;
    if (keyboard_check(ord("W"))) move_y -= 1;
    if (keyboard_check(ord("S"))) move_y += 1;

    if (move_x != 0 || move_y != 0)
    {
        // Normalize diagonal movement
        var move_length = point_distance(0, 0, move_x, move_y);

        move_x /= move_length;
        move_y /= move_length;

        // Find maximum allowed dash distance
        var allowed_distance = dash_distance;

        // Check entire path for boss doors
        for (var i = 1; i <= dash_distance; i++)
        {
            var check_x = x + move_x * i;
            var check_y = y + move_y * i;

            if (place_meeting(check_x, check_y, oMiniBossDoor)
            || place_meeting(check_x, check_y, oFinalBossDoor))
            {
                allowed_distance = i - 1;
                break;
            }
        }

        // Calculate destination
        var target_x = x + move_x * allowed_distance;
        var target_y = y + move_y * allowed_distance;

        var last_x = target_x;
        var last_y = target_y;

        // Check landing position for regular enemies and walls
        if (place_meeting(target_x, target_y, oEnemy)
        || place_meeting(target_x, target_y, oWall))
        {
            for (var i = 1; i <= allowed_distance; i++)
            {
                var check_x = target_x - move_x * i;
                var check_y = target_y - move_y * i;

                if (!place_meeting(check_x, check_y, oEnemy)
                && !place_meeting(check_x, check_y, oWall)
                && !place_meeting(check_x, check_y, oMiniBossDoor)
                && !place_meeting(check_x, check_y, oFinalBossDoor))
                {
                    last_x = check_x;
                    last_y = check_y;
                    break;
                }
            }
        }

        dash_preview_x = last_x;
        dash_preview_y = last_y;
        dash_preview_active = (allowed_distance > 0);
    }
    else
    {
        dash_preview_active = false;
    }
}

// SHIFT RELEASED
if (keyboard_check_released(vk_shift))
{
    if (dash_preview_active && mana >= 10)
    {
        x = dash_preview_x;
        y = dash_preview_y;

        mana -= 10;
    }

    dash_preview_active = false;
}


// =====================
// CAMERA
// =====================

camera_set_view_pos(
    camera,
    x - camera_get_view_width(camera) / 2,
    y - camera_get_view_height(camera) / 2
);


// =====================
// VICTORY CONDITION
// =====================

if (global.playerscore >= 1)
{
    room_goto(rmVictory);
}


// =====================
// MANA REGENERATION
// =====================

if (mana < max_mana)
{
    mana += 1 / 10;
    mana = min(mana, max_mana);
}


// =====================
// FIRE SPELL
// =====================

var fire_mana_cost = 20;

if (has_fire_spell
&& keyboard_check_pressed(ord("1"))
&& fire_cooldown <= 0
&& mana >= fire_mana_cost)
{
    var _fire = instance_create_layer(
        x  , y , "Instances", obj_fireball
    );

_fire.target_x = mouse_x;
_fire.target_y = mouse_y;

    mana -= fire_mana_cost;
    fire_cooldown = 30;
	fire_spell_used = true;
}

if (fire_cooldown > 0)
{
    fire_cooldown -= 1;
}