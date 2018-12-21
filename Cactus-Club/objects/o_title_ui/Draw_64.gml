/// @description Insert description here
// You can write your code in this editor

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

if show_volume {
	draw_text(405,203,string(global.vol*100));
}

draw_set_color(c_white);
draw_set_halign(fa_left);