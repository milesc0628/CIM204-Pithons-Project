<<<<<<< Updated upstream
oPlayer.hp = max(0, oPlayer.hp - 10);
instance_destroy();
=======
// DAMAGE PLAYER
var bullet_damage = 25;

other.hp = max(0, other.hp - bullet_damage);

// DESTROY BULLET
instance_destroy();
>>>>>>> Stashed changes
