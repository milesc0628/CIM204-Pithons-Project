with (other)
{
    if (vulnerable) hp -= 20;
    else hp -= 5;

    if (hp <= 0)
    {
        instance_create_depth(x, y, -100, oKey);
        instance_destroy();
    }
}
instance_destroy();
