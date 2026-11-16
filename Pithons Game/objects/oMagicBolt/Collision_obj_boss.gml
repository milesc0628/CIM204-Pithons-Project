with (other)
{
    if (vulnerable) hp -= 20;
    else hp -= 5;

    if (hp <= 0)
    {
        instance_create_depth(x, y, -100, oKey);
        instance_destroy();
		oPlayer.max_mana *= 10;
		oPlayer.mana_regen_rate *= 10;
		oPlayer.health_regen += 10;
		oPlayer.hp += 50;
    }
}
instance_destroy();
