if (mana >= 10) {
    instance_create_depth(x + 290, y + 290, depth + 1, oMagicBolt);
    mana -= 10;
    
    timer = 0;
}