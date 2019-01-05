

switch page {

	case menu.main:
	option_[options.new_game] = "New Game";
	option_[options.continue_game] = "Continue";
	option_[options.options] = "Options";
	option_[options.quit] = "Quit";
	option_length_ = 4;
	break;
	
	case menu.options:
	option_[options2.fullscreen] = "Fullscreen";
	option_[options2.musicvol] = "Music Volume";
	option_[options2.sfxvol] = "SFX Volume";
	option_[options2.back] = "Back";
	option_length_ = 4;
	break;
}

if o_input.up_pressed_ and o_input.alarm[0] <= 0
{
	index_ = max(--index_, 0)
	o_input.alarm[0] = global.one_second*.15;
}

if o_input.down_pressed_ and o_input.alarm[0] <= 0
{
	index_ = min(++index_, option_length_-1)
	o_input.alarm[0] = global.one_second*.15;
}
if !global.gamepad_active 
{
if (device_mouse_y_to_gui(0) >= 171 and device_mouse_y_to_gui(0)<= 200) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = options.new_game;	
} else if (device_mouse_y_to_gui(0) >= 201 and device_mouse_y_to_gui(0)<= 230 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = options.continue_game;	
} else if (device_mouse_y_to_gui(0) >= 231 and device_mouse_y_to_gui(0)<= 260 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = options.options;	
} else if (device_mouse_y_to_gui(0) >= 261 and device_mouse_y_to_gui(0)<= 290 ) and (device_mouse_x_to_gui(0) >= 190 and device_mouse_x_to_gui(0) <= 370 ) {
		index_ = options.quit;	
}
}

if o_input.select_
{
	
	switch page {
		
	case menu.main:
	switch (index_)
	{
		case options.continue_game:
			show_debug_message("Continue");
			room_goto(r_Outside_Lobby);
			break;
		case options.new_game:
			room_goto(r_Outside_Lobby); //Select to start at 
			//room_goto(r_protodung);
			break;
		/*case options.credits:
			show_debug_message("Credits");
			break;*/
		case options.options:
			page = menu.options;
			break;
		case options.quit:
			game_end();
			break;
	}
	break;
	
	case menu.options:
	switch (index_)
	{
		case options2.fullscreen:
			global.fullscreen = !global.fullscreen;
			window_set_fullscreen(global.fullscreen);
			break;
		case options2.musicvol:
			
			
			break;
		
		case options2.sfxvol:
			
			break;
		case options2.back:
			page = menu.main;
			break;
	}
	break;
	
	}
}

//Volume
if page == menu.options {
	show_volume = true;
	if index_ == options2.musicvol {
	
		if o_input.right_pressed_ {
			if global.vol < 1 global.vol += 0.05;
			audio_master_gain(global.vol);
			alarm[1] = room_speed*.25;
		}

		if o_input.left_pressed_ {
			if global.vol > 0 global.vol -= 0.05;
			audio_master_gain(global.vol);
			alarm[1] = room_speed*.25;
		}
	}
	
} else {
	show_volume = false;
}