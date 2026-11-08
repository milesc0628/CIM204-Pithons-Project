draw_self();
// hp bar size
var bar_width = 60;
var bar_height = 8;

// Position above enemy
var bar_x = x - bar_width / 2;
var bar_y = y - 40;

// hp percentage
var hp_percent = Enemyhp / max_hp;

// Background
draw_set_color(c_black);
draw_rectangle(
    bar_x,
    bar_y,
    bar_x + bar_width,
    bar_y + bar_height,
    false
);

// hp
draw_set_color(c_red);
draw_rectangle(
    bar_x,
    bar_y,
    bar_x + (bar_width * hp_percent),
    bar_y + bar_height,
    false
);

// Reset color
draw_set_color(c_white);