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
var health_percent = clamp(hp / 100, 0, 1);

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


if (has_fire_spell && !fire_spell_used)
{
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Tutorial box
    draw_set_alpha(0.8);
    draw_set_color(c_black);

    draw_rectangle(
        gui_w / 2 - 130,
        gui_h - 110,
        gui_w / 2 + 130,
        gui_h - 55,
        false
    );

    // Tutorial text
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        gui_w / 2,
        gui_h - 82,
        "Press [1] to cast Fireball!"
    );

    // Reset drawing settings
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
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