hp -= 10;
instance_destroy(other);

if (hp <= 0)
{
	room_goto(rmGameOver);
}