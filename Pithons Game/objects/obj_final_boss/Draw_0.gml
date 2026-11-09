if (state == "split")
{
    var _pulse = 1.1 + sin(current_time / 150) * 0.05;
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * _pulse, image_yscale * _pulse, 0, c_yellow, 0.4);
}
draw_self();