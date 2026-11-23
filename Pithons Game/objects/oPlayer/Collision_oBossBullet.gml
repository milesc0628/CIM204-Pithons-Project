hp -= 25;
instance_destroy(other);

if (hp <= 0)
{
	room_goto(rmGameOver);
}