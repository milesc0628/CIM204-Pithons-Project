draw_self();
// Health bar size
var bar_width = 370;
var bar_height = 28;

// Position above enemy
var bar_x = x - bar_width / 2;
var bar_y = y - 40;

// Health percentage
var health_percent = hp / max_hp;

// Background
draw_set_color(c_black);
draw_rectangle(
    bar_x,
    bar_y,
    bar_x + bar_width,
    bar_y + bar_height,
    false
);

// Health
draw_set_color(c_red);
draw_rectangle(
    bar_x,
    bar_y,
    bar_x + (bar_width * health_percent),
    bar_y + bar_height,
    false
);

// Reset color
draw_set_color(c_white);

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
