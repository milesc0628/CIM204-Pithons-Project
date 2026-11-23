if (!visible_map) exit;

var _now = current_time;

// Remember the game's draw state, then force a known-good one
var _old_alpha = draw_get_alpha();
var _old_color = draw_get_color();
draw_set_alpha(1);
draw_set_color(c_white);
gpu_set_blendmode(bm_normal);
gpu_set_colorwriteenable(true, true, true, true);

// map pixels per world pixel, and how much world the map shows
var _scale = map_w / view_px;
var _vw = map_w / _scale;
var _vh = map_h / _scale;

// the player's TRUE centre (used for exact enemy distances)
var _p   = instance_find(target, 0);
var _ptx = view_cx;
var _pty = view_cy;
if (_p != noone) {
    _ptx = (_p.bbox_left + _p.bbox_right)  * 0.5;
    _pty = (_p.bbox_top  + _p.bbox_bottom) * 0.5;

    // the terrain eases toward the player so scrolling isn't jarring
    if (!view_init) {
        view_cx = _ptx;  view_cy = _pty;  view_init = true;
    } else {
        view_cx = lerp(view_cx, _ptx, smooth);
        view_cy = lerp(view_cy, _pty, smooth);
    }
}

// world coords of the map's top-left corner (terrain only)
var _left = view_cx - _vw * 0.5;
var _top  = view_cy - _vh * 0.5;

// screen-space bounds of the minimap box (inclusive) and its middle
var _bx2 = map_x + map_w - 1;
var _by2 = map_y + map_h - 1;
var _mcx = map_x + map_w * 0.5;
var _mcy = map_y + map_h * 0.5;

// background
draw_set_color(bg_col);
draw_set_alpha(bg_alpha);
draw_rectangle(map_x, map_y, _bx2, _by2, false);
draw_set_alpha(1);

// tiles: only the cells that are inside the view
draw_set_color(tile_col);
for (var m = 0; m < array_length(tilemaps); m++) {
    var _t  = tilemaps[m];
    var _tw = tilemap_get_width(_t);
    var _th = tilemap_get_height(_t);
    var _tx0 = max(0,       floor(_left / tile_w));
    var _tx1 = min(_tw - 1, floor((_left + _vw) / tile_w));
    var _ty0 = max(0,       floor(_top / tile_h));
    var _ty1 = min(_th - 1, floor((_top + _vh) / tile_h));

    for (var ty = _ty0; ty <= _ty1; ty++) {
        for (var tx = _tx0; tx <= _tx1; tx++) {
            if (tile_get_index(tilemap_get(_t, tx, ty)) == 0) continue;

            var _rx1 = map_x + floor((tx * tile_w - _left) * _scale);
            var _ry1 = map_y + floor((ty * tile_h - _top)  * _scale);
            var _rx2 = map_x + floor(((tx + 1) * tile_w - _left) * _scale) - 1;
            var _ry2 = map_y + floor(((ty + 1) * tile_h - _top)  * _scale) - 1;

            // clip to the box
            _rx1 = max(_rx1, map_x);  _ry1 = max(_ry1, map_y);
            _rx2 = min(_rx2, _bx2);   _ry2 = min(_ry2, _by2);
            if (_rx2 >= _rx1 && _ry2 >= _ry1) draw_rectangle(_rx1, _ry1, _rx2, _ry2, false);
        }
    }
}

// markers: placed by their TRUE distance from the player, so "touching" looks like touching
for (var k = 0; k < array_length(markers); k++) {
    var _m    = markers[k];
    var _minh = _m.size * 0.5;
    var _n    = instance_number(_m.obj);

    for (var j = 0; j < _n; j++) {
        var _inst = instance_find(_m.obj, j);
        var _dx = 0;
        var _dy = 0;

        if (_inst != _p) {
            // offset from the player, in world pixels
            var _ox = (_inst.bbox_left + _inst.bbox_right)  * 0.5 - _ptx;
            var _oy = (_inst.bbox_top  + _inst.bbox_bottom) * 0.5 - _pty;

            // light smoothing of the offset (stored on the instance as mm_dx / mm_dy)
            if (!variable_instance_exists(_inst, "mm_dx")) {
                _inst.mm_dx = _ox;  _inst.mm_dy = _oy;  _inst.mm_t = -1;
            }
            if (_inst.mm_t != _now) {          // only move once per frame, even if listed twice
                _inst.mm_dx = lerp(_inst.mm_dx, _ox, marker_smooth);
                _inst.mm_dy = lerp(_inst.mm_dy, _oy, marker_smooth);
                _inst.mm_t = _now;
            }
            _dx = _inst.mm_dx;
            _dy = _inst.mm_dy;
        }

        // size: fixed (default), or grown to the object's real collision box if real_size is on
        var _hw = _minh;
        var _hh = _minh;
        if (real_size) {
            _hw = max(_minh, (_inst.bbox_right  - _inst.bbox_left) * 0.5 * _scale);
            _hh = max(_minh, (_inst.bbox_bottom - _inst.bbox_top)  * 0.5 * _scale);
        }

        var _cxp = _mcx + _dx * _scale;
        var _cyp = _mcy + _dy * _scale;

        // centre outside the map: hide it, or pin it to the edge
        if (_cxp < map_x || _cxp > _bx2 || _cyp < map_y || _cyp > _by2) {
            if (!pin_markers) continue;
            _cxp = clamp(_cxp, map_x + _hw + 1, _bx2 - _hw - 1);
            _cyp = clamp(_cyp, map_y + _hh + 1, _by2 - _hh - 1);
        }

        var _x1 = floor(_cxp - _hw);
        var _y1 = floor(_cyp - _hh);
        var _x2 = max(_x1, floor(_cxp + _hw) - 1);
        var _y2 = max(_y1, floor(_cyp + _hh) - 1);

        // outline, then fill (both clipped so nothing crosses the border)
        draw_set_color(outline_col);
        draw_rectangle(max(_x1 - 1, map_x), max(_y1 - 1, map_y), min(_x2 + 1, _bx2), min(_y2 + 1, _by2), false);
        draw_set_color(_m.col);
        draw_rectangle(max(_x1, map_x), max(_y1, map_y), min(_x2, _bx2), min(_y2, _by2), false);
    }
}

// border
draw_set_color(border_col);
draw_rectangle(map_x, map_y, _bx2, _by2, true);

// give the game back its draw state
draw_set_alpha(_old_alpha);
draw_set_color(_old_color);
