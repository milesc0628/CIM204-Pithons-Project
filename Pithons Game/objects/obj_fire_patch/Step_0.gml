// Count down the lifetime
life_timer--;

if (life_timer <= 0) {
    instance_destroy();
    exit;
}

// Damage enemies over time
damage_timer--;

if (damage_timer <= 0) {
    damage_timer = damage_interval;

    var _enemy = instance_place(x, y, oEnemy);

    if (_enemy != noone) {
        _enemy.Enemyhealth -= damage;

        if (_enemy.Enemyhealth <= 0) {
            with (_enemy) {
                instance_destroy();
            }
        }
    }
}