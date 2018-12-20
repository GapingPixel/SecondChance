/// @description Pause Menu
if !sprite_exists(paused_sprite_) then exit;

draw_sprite_ext(paused_sprite_, 0, 0, 0, paused_sprite_scale, paused_sprite_scale, 0 , c_white, 1);
draw_set_alpha(0.6);
draw_rectangle_color(0, 0, gui_width_, gui_height_, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_set_halign(fa_center)
for (var _i = 0; _i<option_length_; _i++)
{
	if _i == index_
	{
		draw_set_color(menu_color_);
	} else
	{
		draw_set_color(menu_dark_color_);
	}
	draw_text_transformed(x_, y_+_i*25, option_[_i], 1.5, 1.5, 0);
}
draw_set_color(c_white);
draw_set_halign(fa_left);