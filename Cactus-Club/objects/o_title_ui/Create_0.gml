enum options
{
	//continue_game,
	new_game,
	//credits,
	quit
}

menu_color_ = make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = make_color_rgb(126, 127, 81); //58, 173, 133

//option_[options.continue_game] = "Continue";
option_[options.new_game] = "New Game";
//option_[options.credits] = "Credits";
option_[options.quit] = "Quit";

option_length_ = array_length_1d(option_)

index_ = options.new_game;

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

x_ = 625;//gui_width_ -800;
y_ = 400;//gui_height_-390;