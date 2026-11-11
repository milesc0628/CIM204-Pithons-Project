// Lifetime countdown
life_timer--;
// Face direction of travel
image_angle = direction;

if (life_timer <= 0)
{
    instance_destroy();
}