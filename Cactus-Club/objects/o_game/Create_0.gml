/// @description Insert description here
// You can write your code in this editor
global.player_start_position = xy_gameStart;
instance_create_depth(mouse_x,mouse_y,-9999,o_cursor);
global.inventory_page = 1;
global.grace_pescatarian = false;
global.one_second = room_speed;
#macro PAGE_END -1
#macro INTRO 0
#macro EDDYSON 1
#macro HEATHER 2
#macro REYNOLDS 3
#macro BIZI 4
#macro DINA 5
#macro GRACE 6

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

//Menu stuff
enum pauseoptions
{
	//continue_game,
	resume,
	options,
	//credits,
	quit
}

enum pauseoptions2
{
	fullscreen,
	musicvol,
	sfxvol,
	//credits,
	back
}

enum pausemenu
{
	main,
	options
}

menu_color_ = c_aqua; //make_color_rgb(247, 243, 143); //185, 248, 216
menu_dark_color_ = c_black; //make_color_rgb(126, 127, 81); //58, 173, 133

//option_[options.continue_game] = "Continue";
option_[pauseoptions.resume] = "Resume";
//option_[options.credits] = "Credits";
option_[pauseoptions.quit] = "Quit";

option_length_ = array_length_1d(option_)

index_ = options.new_game;

gui_height_ = display_get_gui_height();
gui_width_ = display_get_gui_width();

x_ = 300;//gui_width_ -800;
y_ = 170;//gui_height_-390;

paused_ = false;
paused_sprite_ = noone;
paused_sprite_scale = .5;


page = menu.main;

global.fullscreen = 0;
global.vol = 1;
show_volume = false;