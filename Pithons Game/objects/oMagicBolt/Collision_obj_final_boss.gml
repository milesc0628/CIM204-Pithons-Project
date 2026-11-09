with (other)
{
    if (vulnerable) hp -= 20;
    else hp -= 5;

    if (state == "split" && split_ends_on_hit)
    {
        with (obj_boss_clone) instance_destroy();
        state = "recover";
        state_timer = attack_cooldown;
    }

    if (hp <= 0) instance_destroy();
}
instance_destroy();
