// =====================================
// ENEMY CREATE EVENT
// =====================================

// ORIGINAL VARIABLES
chasing = false;
music_id = -1;

Enemyhealth = 50;
max_health = 50;

start_x = x;
start_y = y;

// =====================================
// MOVEMENT
// =====================================

// Speed when approaching player
move_speed = 2.5;

// Distance needed to attack
attack_range = 40;

// =====================================
// ATTACK
// =====================================

// Damage dealt per attack
attack_damage = 10;

// =====================================
// RETREAT
// =====================================

// Speed when backing away
retreat_speed = 4;

// How far enemy backs away
retreat_distance = 110;

retreat_remaining = 0;
retreat_direction = 0;

// =====================================
// COOLDOWN
// =====================================

// Pause between attacks
attack_cooldown = 45;
cooldown_timer = 0;

// =====================================
// STATES
// =====================================

// idle, approach, retreat, cooldown
state = "idle";

// Short delay before first approach
start_delay = 45;