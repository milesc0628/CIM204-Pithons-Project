other.Enemyhealth -= 10;

if (other.Enemyhealth <= 0) {
	oPlayer.max_mana += 10;
	oPlayer.mana_regen_rate *=2;
    instance_destroy(other);
}

instance_destroy();