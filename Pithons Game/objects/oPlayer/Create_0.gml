camera = camera_create_view(
    x - camera_get_view_width(view_camera[0]) / 2,
    y - camera_get_view_height(view_camera[0]) / 2,
    camera_get_view_width(view_camera[0]),
    camera_get_view_height(view_camera[0])
);

view_camera[0] = camera;

timer = 0;
cooldown = 0;
health = 100;
global.playerscore = 0;