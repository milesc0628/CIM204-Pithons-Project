if (keyboard_check_pressed(vk_shift) && mana >= 10) {

    var move_x = 0;
    var move_y = 0;

    if (keyboard_check(ord("A"))) move_x -= 1;
    if (keyboard_check(ord("D"))) move_x += 1;
    if (keyboard_check(ord("W"))) move_y -= 1;
    if (keyboard_check(ord("S"))) move_y += 1;

    if (move_x != 0 || move_y != 0) {
        x += move_x * 80;
        y += move_y * 80;

        mana -= 10;
    }
}


camera_set_view_pos(
    camera,
    x - camera_get_view_width(camera) / 2,
    y - camera_get_view_height(camera) / 2
);


if (global.playerscore >= 5){
    room_goto(rmVictory);
}

// Mana regeneration
if (mana < max_mana) {
    mana += 1 / 10;
    mana = min(mana, max_mana);
}

//fire spell
var fire_mana_cost = 20;

// Cast with the 1 key
if (has_fire_spell
&& keyboard_check_pressed(ord("1"))
&& fire_cooldown <= 0
&& mana >= fire_mana_cost) {

    var _fire = instance_create_layer(
        x, y, "Instances", obj_fireball
    );

    _fire.target_x = mouse_x;
    _fire.target_y = mouse_y;

    mana -= fire_mana_cost;
    fire_cooldown = 30;
}
fire_cooldown -= 1;