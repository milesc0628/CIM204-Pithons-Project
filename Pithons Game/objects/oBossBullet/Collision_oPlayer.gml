// =====================
// BOSS BULLET DAMAGE
// =====================

// Damage player
other.hp -= 10;

// Check if player died
if (other.hp <= 0)
{
    other.hp = 0;
    room_goto(rmGameOver);
}

// Destroy bullet
instance_destroy();