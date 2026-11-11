other.Enemyhealth -= 10;

if (other.Enemyhealth <= 0) {
    instance_destroy(other);
}

instance_destroy();