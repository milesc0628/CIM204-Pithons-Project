
// =====================================
// FINAL BOSS DRAW EVENT
// =====================================

// DRAW BOSS NORMALLY
draw_self();

// =====================================
// GLOWING PHASE EFFECT
// =====================================

if (glow_phase)
{
    // Pulsing glow effect
    var _pulse = 1.1 + sin(current_time / 150) * 0.05;

    // Draw yellow glow around boss
    draw_sprite_ext(
        sprite_index,
        image_index,
        x,
        y,
        image_xscale * _pulse,
        image_yscale * _pulse,
        image_angle,
        c_yellow,
        0.4
    );
}
