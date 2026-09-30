draw_self();
// Health bar size
var bar_width = 60;
var bar_height = 8;

// Position above enemy
var bar_x = x - bar_width / 2;
var bar_y = y - 40;

// Health percentage
var health_percent = Enemyhealth / max_health;

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