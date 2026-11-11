other.Enemyhealth -= 10;

if (other.Enemyhealth <= 0) {
	oPlayer.max_mana += 10;
    instance_destroy(other);
}

instance_destroy();