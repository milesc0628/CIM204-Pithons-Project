// =====================================
// BOSS STATS
// =====================================
hp = 200;
max_hp = 200;

// =====================================
// MOVEMENT
// =====================================
move_speed = 1.0;

// Boss starts asleep
aggro = false;

// =====================================
// SHOCKWAVE ATTACK
// =====================================
damage = 30;
attack_range = 120;
charge_time = 45;
stun_time = 90;
attack_cooldown = 45;

// =====================================
// BOSS STATE
// =====================================
state = "chase";
state_timer = 0;

vulnerable = false;
shockwave_hit = false;

// =====================================
// DAMAGE MULTIPLIERS
// =====================================
normal_damage_multiplier = 1;
stun_damage_multiplier = 2;