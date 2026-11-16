timer += 1;

if (timer >= 30) {
    if (mana >= 10) {
        instance_create_depth(x, y, depth + 1, oMagicBolt);
        mana -= 10;
    }

    timer = 0;
}