timer += 1;

if (timer >= 30) {
    if (mana >= 10) {
        instance_create_depth(x + 32, y + 32, depth + 1, oMagicBolt);
        mana -= 10;
    }

    timer = 0;
}