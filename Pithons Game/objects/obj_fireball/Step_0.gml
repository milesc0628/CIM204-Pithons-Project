var _dist = point_distance(x, y, target_x, target_y);

if (_dist <= move_speed) {
    x = target_x;
    y = target_y;

    instance_create_layer(x, y, "Instances", obj_fire_patch);
    instance_destroy();
} else {
    var _dir = point_direction(x, y, target_x, target_y);

    x += lengthdir_x(move_speed, _dir);
    y += lengthdir_y(move_speed, _dir);
}