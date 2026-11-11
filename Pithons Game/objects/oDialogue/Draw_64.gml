/// oDialogue - Draw GUI Event
/// Draws the dialogue box at the top of the screen.

// If the box isn't open, draw nothing
if (!global.dialogue_active) exit;

// Box size and position
var _gui_w  = display_get_gui_width();
var _margin = 20;
var _box_h  = 140;
var _x1 = _margin;
var _y1 = _margin;
var _x2 = _gui_w - _margin;
var _y2 = _margin + _box_h;

// Dark see-through background
draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(_x1, _y1, _x2, _y2, false);
draw_set_alpha(1);

// White border
draw_set_color(c_white);
draw_rectangle(_x1, _y1, _x2, _y2, true);

// Speaker name in yellow
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_yellow);
draw_text(_x1 + 16, _y1 + 12, speaker);

// The current line in white, wrapped to fit the box
draw_set_color(c_white);
draw_text_ext(_x1 + 16, _y1 + 40, lines[line_index], 22, (_x2 - _x1) - 32);

// Hint in the bottom-right corner
draw_set_halign(fa_right);
draw_text(_x2 - 16, _y2 - 28, "Space / Enter >");

// Reset settings so other objects draw normally
draw_set_halign(fa_left);
draw_set_color(c_white);