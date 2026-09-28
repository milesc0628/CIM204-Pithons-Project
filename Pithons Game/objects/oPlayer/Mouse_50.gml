if (mouse_check_button(mb_left)) {
    timer += 1;

    if (timer >= 15) {
        instance_create_depth(x, y, depth + 1, oMagicBolt);
        timer = 0;
    }
} else {
    timer = 0;
}