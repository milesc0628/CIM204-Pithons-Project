
// =====================================
// FINAL BOSS CREATE EVENT
// =====================================

// HEALTH
hp = 1000;
max_hp = 1000;
vulnerable = false;

// NORMAL BOSS STATE
state = "chase";
state_timer = 0;

// MOVEMENT
move_speed = 2;
attack_range = 120;

// NORMAL ATTACK SETTINGS
charge_time = 60;
stun_time = 120;
attack_cooldown = 90;
damage = 20;

// =====================================
// GLOWING PHASE
// =====================================

// Phase tracking
split_stage = 0;
split_ends_on_hit = false;

// Boss starting position
home_x = x;
home_y = y;

// Glow phase settings
glow_phase = false;
glow_duration = 600;
glow_timer = 0;

// Extra damage taken while glowing
glow_damage_multiplier = 2;

// =====================================
// PROJECTILE ATTACK
// =====================================

shoot_timer = 60;
shoot_cooldown = 90;

// =====================================
// MELEE ATTACK
// =====================================

melee_range = 70;
melee_damage = 20;
melee_cooldown = 60;
melee_timer = 0;

// =====================================
// AGGRO SETTINGS
// =====================================

aggro = false;
aggro_range = 300;
move_timer = 0;

// =====================================
// START GLOWING PHASE
// =====================================

// Replaces the old clone spawning function
start_split = function(_num)
{
    // Activate glowing phase
    glow_phase = true;

    // Start glow timer
    glow_timer = glow_duration;

    // Boss becomes vulnerable
    vulnerable = true;

    // Switch to glowing combat state
    state = "glow";

    // Reset attack timers
    shoot_timer = 30;
    melee_timer = 30;

    // Keep track of phase progression
    split_stage += 1;
};
