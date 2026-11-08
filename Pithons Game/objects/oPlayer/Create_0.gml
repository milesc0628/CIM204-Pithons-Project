start_x = x;
start_y = y;

camera = camera_create_view(
    x - camera_get_view_width(view_camera[0]) / 2,
    y - camera_get_view_height(view_camera[0]) / 2,
    camera_get_view_width(view_camera[0]),
    camera_get_view_height(view_camera[0])
);

view_camera[0] = camera;

timer = 0;
cooldown = 0;
hp = 100;
global.playerscore = 0;
key_collected = 0;

has_fire_spell = false;
fire_cooldown = 0;
mana = 100;
max_mana = 100;
game_over = false;