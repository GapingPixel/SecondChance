enum options
{
	new_game,
	continue_game,
	options,
	//credits,
	quit
}

enum options2
{
	fullscreen,
	musicvol,
	sfxvol,
	//credits,
	back
}

enum menu
{
	main,
	options
}

menu_color_ = c_aqua;//make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = c_black;//make_color_rgb(126, 127, 81); //58, 173, 133

option_[options.new_game] = "New Game";
option_[options.continue_game] = "Continue";
option_[options.options] = "Options";
option_[options.quit] = "Quit";

option_length_ = array_length_1d(option_);

index_ = options.new_game;

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

x_ = 300;//gui_width_ -800;
y_ = 170;//gui_height_-390;

page = menu.main;

show_volume = false;