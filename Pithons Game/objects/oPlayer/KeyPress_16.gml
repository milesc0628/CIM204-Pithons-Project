if (dash_cooldown > 0) {
    dash_cooldown -= 1;
}

if (keyboard_check_pressed(vk_shift) && dash_cooldown <= 0) {

    var move_x = 0;
    var move_y = 0;

    if (keyboard_check(ord("A"))) move_x -= 1;
    if (keyboard_check(ord("D"))) move_x += 1;
    if (keyboard_check(ord("W"))) move_y -= 1;
    if (keyboard_check(ord("S"))) move_y += 1;

    if (move_x != 0 || move_y != 0) {
        x += move_x * 80;
        y += move_y * 80;

        dash_cooldown = 60;
    }
}