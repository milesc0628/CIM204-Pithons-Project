// ---------- CONFIG ----------
target       = oPlayer;               // the map follows this (always drawn in the middle)

tile_layers  = ["Tiles"];             // <-- your tile layer name(s), exactly as in the Room editor

map_w        = 200;                   // minimap size in GUI pixels
map_h        = 200;
margin       = 16;
map_x        = display_get_gui_width() - map_w - margin;   // top-right
map_y        = margin;

view_px      = 2400;                  // how much of the world the map shows, in game pixels (width = height).
                                      // Bigger = more world on the map, so distances shrink and enemies that
                                      // touch you look like they touch you.
view_px_min  = 400;                   // most zoomed in
view_px_max  = 4000;                  // most zoomed out (your world is about 2500 x 1800)

smooth       = 0.15;                  // how smoothly the TERRAIN scrolls (1 = jumpy, lower = smoother)
marker_smooth= 0.6;                   // how smoothly enemy boxes move relative to the player.
                                      // Keep this high (0.5 - 1) so distances stay accurate.
pin_markers  = false;                 // false = enemies only appear while inside the map (like the player box)
                                      // true  = far-away enemies are pinned to the box edge

// Draw order: first = bottom, last = on top. size = box size in minimap pixels.
markers = [
    { obj: OTurret,         col: c_orange,  size: 5 },
    { obj: oEnemy,          col: c_red,     size: 5 },
    { obj: obj_boss,        col: c_fuchsia, size: 7 },
    { obj: obj_final_boss,  col: c_yellow,  size: 9 },
    { obj: oPlayer,         col: c_lime,    size: 5 }
];

real_size    = false;                 // false = every box is exactly its `size` above
                                      // true  = boxes grow to the object's real size (never smaller than `size`)

bg_col       = c_black;
bg_alpha     = 0.55;
tile_col     = c_gray;
border_col   = c_white;
outline_col  = c_black;               // thin outline around every marker so they stand out

key_toggle   = ord("M");              // show / hide
key_zoom_in  = vk_add;                // numpad +
key_zoom_out = vk_subtract;           // numpad -

// ---------- INTERNAL ----------
visible_map = true;
tile_w      = 16;
tile_h      = 16;
view_cx     = room_width  * 0.5;      // smoothed centre of the map, in world pixels
view_cy     = room_height * 0.5;
view_init   = false;                  // snaps to the player on the first frame

// find the tilemaps once (no surfaces are used anywhere in this object)
tilemaps = [];
for (var i = 0; i < array_length(tile_layers); i++) {
    var _lay = layer_get_id(tile_layers[i]);
    if (_lay == -1) {
        show_debug_message("obj_minimap: layer '" + string(tile_layers[i]) + "' not found");
        continue;
    }
    var _tm = layer_tilemap_get_id(_lay);
    if (_tm == -1) {
        show_debug_message("obj_minimap: layer '" + string(tile_layers[i]) + "' has no tilemap");
        continue;
    }
    array_push(tilemaps, _tm);
}

if (array_length(tilemaps) > 0) {
    tile_w = tilemap_get_tile_width(tilemaps[0]);
    tile_h = tilemap_get_tile_height(tilemaps[0]);
}
