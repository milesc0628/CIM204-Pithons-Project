hp = 100;
max_hp = 100;
vulnerable = false;

state = "chase";
state_timer = 0;

move_speed = 2;
attack_range = 120;
charge_time = 60;
stun_time = 120;
attack_cooldown = 90;
damage = 20;


split_stage = 0;
split_ends_on_hit = false;
home_x = x;
home_y = y;
shoot_timer = 60;
shoot_cooldown = 90;

start_split = function(_num)
{
	var _c = instance_create_depth(x, y, -100, obj_boss_clone);
    var _m = 64;
    var _spots = [
        [_m, _m], [room_width - _m, _m],
        [_m, room_height - _m], [room_width - _m, room_height - _m],
        [room_width / 2, _m], [room_width / 2, room_height - _m],
        [_m, room_height / 2], [room_width - _m, room_height / 2]
    ];

    // real boss takes a random spot too
    var _i = irandom(array_length(_spots) - 1);
    home_x = _spots[_i][0];
    home_y = _spots[_i][1];
    array_delete(_spots, _i, 1);

    repeat (_num)
    {
        var _j = irandom(array_length(_spots) - 1);
        var _c = instance_create_depth(x, y, depth, obj_boss_clone);
        _c.home_x = _spots[_j][0];
        _c.home_y = _spots[_j][1];
        _c.owner = id;
        array_delete(_spots, _j, 1);
    }

    split_ends_on_hit = (_num == 3);
    state = "split";
};
split_stage = 0;
split_ends_on_hit = false;
home_x = x;
home_y = y;
shoot_timer = 60;
shoot_cooldown = 90;

start_split = function(_num)
{
    var _m = 64;
    var _spots = [
        [_m, _m], [room_width - _m, _m],
        [_m, room_height - _m], [room_width - _m, room_height - _m],
        [room_width / 2, _m], [room_width / 2, room_height - _m],
        [_m, room_height / 2], [room_width - _m, room_height / 2]
    ];

    var _i = irandom(array_length(_spots) - 1);
    home_x = _spots[_i][0];
    home_y = _spots[_i][1];
    array_delete(_spots, _i, 1);

    repeat (_num)
    {
        var _j = irandom(array_length(_spots) - 1);
        var _c = instance_create_depth(x, y, depth, obj_boss_clone);
        _c.home_x = _spots[_j][0];
        _c.home_y = _spots[_j][1];
        _c.owner = id;
        array_delete(_spots, _j, 1);
    }

    split_ends_on_hit = (_num == 3);
    state = "split";
};
aggro = false;
aggro_range = 300;
move_timer = 0;