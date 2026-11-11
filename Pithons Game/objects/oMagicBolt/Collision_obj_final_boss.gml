
with (other)
{
    // Damage boss
    if (vulnerable)
    {
        hp = max(0, hp - 20);
    }
    else
    {
        hp = max(0, hp - 5);
    }

    // Handle split phase
    if (state == "split" && split_ends_on_hit)
    {
        with (obj_boss_clone)
        {
            instance_destroy();
        }

        state = "recover";
        state_timer = attack_cooldown;
    }

    // Do NOT destroy boss here!
    // Boss Step Event handles death and key drop.
}

// Destroy player's magic bolt
instance_destroy();
