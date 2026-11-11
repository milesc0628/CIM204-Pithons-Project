other.Enemyhealth -= 10;

if (other.Enemyhealth <= 0) {
    instance_destroy(other);
	global.playerscore+= 1;
}

instance_destroy();