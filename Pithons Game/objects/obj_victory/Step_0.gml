if (!shown && instance_number(obj_enemy) == 0) {
    visible = true;
    shown = true;
}

if (visible && keyboard_check_pressed(vk_space)) {
    visible = false;
}