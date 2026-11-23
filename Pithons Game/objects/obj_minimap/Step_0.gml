if (keyboard_check_pressed(key_toggle)) visible_map = !visible_map;

if (keyboard_check(key_zoom_in))  view_px /= 1.03;
if (keyboard_check(key_zoom_out)) view_px *= 1.03;
view_px = clamp(view_px, view_px_min, view_px_max);
