
var _dist = point_distance(x, y, target_x, target_y);

var _dir = point_direction(x, y, target_x, target_y);

// Rotate sprite toward movement direction
image_angle = _dir - 90;

// Move toward target
if (_dist <= move_speed) {
    x = target_x;
    y = target_y;

    instance_create_layer(x , y, "Instances", obj_fire_patch);
    instance_destroy();
}
else {
    x += lengthdir_x(move_speed, _dir);
    y += lengthdir_y(move_speed, _dir);
}
