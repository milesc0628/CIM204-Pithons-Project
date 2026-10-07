var bar_width = 300;
var bar_height = 25;

// Position: bottom-center of the screen
var bar_x = (display_get_gui_width() - bar_width) / 2;
var bar_y = display_get_gui_height() - 50;


// =====================
// HEALTH BAR
// =====================

// Background
draw_set_color(c_black);
draw_rectangle(
    bar_x,
    bar_y,
    bar_x + bar_width,
    bar_y + bar_height,
    false
);

// Health amount
var health_percent = health / 100;

// Health fill
draw_set_color(c_red);
draw_rectangle(
    bar_x,
    bar_y,
    bar_x + (bar_width * health_percent),
    bar_y + bar_height,
    false
);


// =====================
// MANA BAR
// =====================

// Mana bar is 5 pixels below health bar
var mana_y = bar_y + bar_height + 5;

// Background
draw_set_color(c_black);
draw_rectangle(
    bar_x,
    mana_y,
    bar_x + bar_width,
    mana_y + bar_height,
    false
);

// Mana amount
var mana_percent = mana / max_mana;

// Mana fill
draw_set_color(c_blue);
draw_rectangle(
    bar_x,
    mana_y,
    bar_x + (bar_width * mana_percent),
    mana_y + bar_height,
    false
);


// Reset drawing color
draw_set_color(c_white);