// Draw the destination preview
if (dash_preview_active)
{
    draw_sprite_ext(
        sprite_index,
        image_index,
        dash_preview_x,
        dash_preview_y,
        image_xscale,
        image_yscale,
        image_angle,
        c_white,
        0.35
    );
}

// Draw the actual player
draw_self();