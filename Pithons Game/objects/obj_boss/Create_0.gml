// Boss Stats
hp = 500;
max_hp = 500;

// Movement
move_speed = 1.0;

// Shockwave Attack
damage = 30;
attack_range = 120;
charge_time = 45;       // 0.75 seconds
stun_time = 90;         // 1.5 seconds
attack_cooldown = 45;   // 0.75 seconds

// Boss State
state = "chase";
state_timer = 0;
vulnerable = false;
shockwave_hit = false;

// Damage Multipliers
normal_damage_multiplier = 1;
stun_damage_multiplier = 2;