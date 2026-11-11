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

    // Check for regular enemies
    var _enemy = instance_place(x, y, oEnemy);

    if (_enemy != noone) {
        _enemy.Enemyhealth -= damage;

        if (_enemy.Enemyhealth <= 0) {
            if (instance_exists(oPlayer)) {
                oPlayer.max_mana += 10;
            }

            with (_enemy) {
                instance_destroy();
            }
        }
    }

    // Check for bosses
    var _boss = instance_place(x, y, obj_boss);

    if (_boss != noone) {
        _boss.hp -= damage;

        if (_boss.hp <= 0) {
            if (instance_exists(oPlayer)) {
                oPlayer.max_mana += 10;
            }

            with (_boss) {
                instance_destroy();
            }
        }
    }

    // Check for final boss
    var _final_boss = instance_place(x, y, obj_final_boss);

    if (_final_boss != noone) {
        _final_boss.hp -= damage;

        if (_final_boss.hp <= 0) {
            if (instance_exists(oPlayer)) {
                oPlayer.max_mana += 10;
            }

            with (_final_boss) {
                instance_destroy();
            }
        }
    }

    // Check for turret
    var _turret = instance_place(x, y, OTurret);

    if (_turret != noone) {
        _turret.Enemyhealth -= damage;

        if (_turret.Enemyhealth <= 0) {
            if (instance_exists(oPlayer)) {
                oPlayer.max_mana += 10;
            }

            with (_turret) {
                instance_destroy();
            }
        }
    }
}